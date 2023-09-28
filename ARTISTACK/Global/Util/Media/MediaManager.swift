//
//  MediaManager.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/27.
//

import AVFoundation
import UIKit

class MediaManager: NSObject{
    
    var captureSession = AVCaptureSession()
    var videoDevice: AVCaptureDevice!
    var videoInput: AVCaptureDeviceInput!
    var audioInput: AVCaptureDeviceInput!
    var videoOutput: AVCaptureMovieFileOutput!
    var deviceOrientation: AVCaptureVideoOrientation = .portrait
    var outputURL: URL?
    var audioPlayer : AVAudioPlayer?
    var videoPlayer : AVPlayer?
    var avSynchronizedLayer: AVSynchronizedLayer?
    var recordEnd: ((URL) -> Void)?
    var composition : AVMutableComposition!
    
    func setupSession() {
        do {
            captureSession.beginConfiguration()
            
            videoInput = try AVCaptureDeviceInput(device: videoDevice!)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
            
            let audioDevice = AVCaptureDevice.default(for: AVMediaType.audio)!
            audioInput = try AVCaptureDeviceInput(device: audioDevice)
            if captureSession.canAddInput(audioInput) {
                captureSession.addInput(audioInput)
            }
            
            videoOutput = AVCaptureMovieFileOutput()
            videoOutput.movieFragmentInterval = .invalid
            if captureSession.canAddOutput(videoOutput) {
                captureSession.addOutput(videoOutput)
            }
            
            captureSession.commitConfiguration()
        }
        catch let error as NSError {
            NSLog("\(error), \(error.localizedDescription)")
        }
    }
    
    func bestDevice(in position: AVCaptureDevice.Position) -> AVCaptureDevice {
        var deviceTypes: [AVCaptureDevice.DeviceType]!
        
        if #available(iOS 11.1, *) {
            deviceTypes = [.builtInTrueDepthCamera, .builtInDualCamera, .builtInWideAngleCamera]
        } else {
            deviceTypes = [.builtInDualCamera, .builtInWideAngleCamera]
        }
        
        let discoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: deviceTypes,
            mediaType: .video,
            position: .unspecified
        )
        
        let devices = discoverySession.devices
        guard !devices.isEmpty else { fatalError("Missing capture devices.")}
        
        return devices.first(where: { device in device.position == position })!
    }
    
    func swapCameraType() {
        guard let input = captureSession.inputs.first(where: { input in
            guard let input = input as? AVCaptureDeviceInput else { return false }
            return input.device.hasMediaType(.video)
        }) as? AVCaptureDeviceInput else { return }
        
        captureSession.beginConfiguration()
        defer { captureSession.commitConfiguration() }
        
        // Create new capture device
        var newDevice: AVCaptureDevice?
        if input.device.position == .back {
            newDevice = bestDevice(in: .front)
        } else {
            newDevice = bestDevice(in: .back)
        }
        
        do {
            videoInput = try AVCaptureDeviceInput(device: newDevice!)
        } catch let error {
            NSLog("\(error), \(error.localizedDescription)")
            return
        }
        
        // Swap capture device inputs
        captureSession.removeInput(input)
        captureSession.addInput(videoInput!)
    }
    
    func prepareRecording(){
        let connection = videoOutput.connection(with: AVMediaType.video)
        if (connection?.isVideoOrientationSupported)! {
            connection?.videoOrientation = self.deviceOrientation
        }
        
        let device = videoInput.device
        if (device.isSmoothAutoFocusSupported) {
            do {
                try device.lockForConfiguration()
                device.isSmoothAutoFocusEnabled = false
                device.unlockForConfiguration()
            } catch {
                print("Error setting configuration: \(error)")
            }
        }
        outputURL = tempURL()
    }
    
    func startRecording() {
        videoOutput.startRecording(to: outputURL!, recordingDelegate: self)
    }
    
    func stopRecording() {
        if videoOutput.isRecording {
            videoOutput.stopRecording()
        }
    }
    
    func tempURL() -> URL? {
        let directory = NSTemporaryDirectory() as NSString
        
        if directory != "" {
            let path = directory.appendingPathComponent(NSUUID().uuidString + ".mp4")
            return URL(fileURLWithPath: path)
        }
        
        return nil
    }
    
    func prepareAudio(data: Data) {
        do {
            audioPlayer = try AVAudioPlayer(data: data)
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func playAudio(){
        audioPlayer?.play()
    }
    
    func stopAudio(){
        audioPlayer?.pause()
        audioPlayer?.currentTime = 0
    }
    
    
    
    func playVideo(url: URL, layer: AVPlayerLayer) {
        do {
            videoPlayer = try AVPlayer(url: url)
            layer.player = videoPlayer
            videoPlayer?.play()
        } catch {
            print("Error playing video: \(error.localizedDescription)")
        }
    }
    
    func playComposition(playerItem: AVPlayerItem, layer: AVPlayerLayer){
        videoPlayer = AVPlayer(playerItem: playerItem)
        layer.player = videoPlayer
        videoPlayer?.play()
    }
    
    
    func mergeAudioAndVideo(audioURL: URL, videoURL: URL, outputURL: URL, completion: @escaping (Error?) -> Void) {
        // 비디오 트랙 생성
        let videoAsset = AVURLAsset(url: videoURL)
        let videoTrack = videoAsset.tracks(withMediaType: .video).first!
        
        // 오디오 트랙 생성
        let audioAsset = AVURLAsset(url: audioURL)
        let audioTrack = audioAsset.tracks(withMediaType: .audio).first!
        
        // 비디오 컴포지션 생성
        let composition = AVMutableComposition()
        let videoCompositionTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        do {
            try videoCompositionTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: videoAsset.duration),
                                                       of: videoTrack,
                                                       at: .zero)
        } catch {
            completion(error)
            return
        }
        
        // 오디오 컴포지션 생성
        let audioCompositionTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        do {
            try audioCompositionTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: videoAsset.duration),
                                                       of: audioTrack,
                                                       at: .zero)
        } catch {
            completion(error)
            return
        }
        
        // 비디오 레이어 인스트럭션 생성
        let videoLayerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: videoCompositionTrack!)
        
        let videoInstruction = AVMutableVideoCompositionInstruction()
        videoInstruction.timeRange = CMTimeRangeMake(start: .zero, duration: videoAsset.duration)
        videoInstruction.layerInstructions = [videoLayerInstruction]
        
        // 비디오 컴포지션 인스트럭션 생성
        let videoComposition = AVMutableVideoComposition()
        videoComposition.instructions = [videoInstruction]
        videoComposition.frameDuration = CMTime(value: 1, timescale: 30) // 30 fps
        
        // 비디오 사이즈 설정 (오디오와 비디오의 크기가 동일해야 함)
        videoComposition.renderSize = videoTrack.naturalSize
        
        // 비디오 병합
        let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)
        exporter?.outputURL = outputURL
        exporter?.outputFileType = .mp4
        exporter?.videoComposition = videoComposition
        
        exporter?.exportAsynchronously {
            DispatchQueue.main.async {
                if let error = exporter?.error {
                    completion(error)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    func merge(audioURL: URL, videoURL: URL, outputURL: URL, completion: @escaping (AVPlayerItem) -> Void){
        composition = AVMutableComposition()
        addVideoTrack(from: videoURL, to: composition)
        addAudioofVideoTrack(from: videoURL, to: composition)
        let duration = calculateVideoDuration(videoURL: videoURL)
        addAudioTrack(from: audioURL, to: composition, duration: duration)
        let videoInputParams = AVMutableAudioMixInputParameters(track: composition.tracks(withMediaType: .audio)[0])
        videoInputParams.setVolume(1.0, at: .zero)
        let audioInputParams = AVMutableAudioMixInputParameters(track: composition.tracks(withMediaType: .audio)[1])
        audioInputParams.setVolume(0.1, at: .zero)
        let audioMix = AVMutableAudioMix()
        audioMix.inputParameters = [audioInputParams, videoInputParams]
        let playerItem = AVPlayerItem(asset: composition)
        playerItem.audioMix = audioMix
        completion(playerItem)
    }
    
    func calculateVideoDuration(videoURL: URL?) -> CMTime {
        guard let videoURL else {return .zero}
        let videoAsset = AVURLAsset(url: videoURL)
        return videoAsset.duration
    }
    
    
    func addVideoTrack(from videoURL: URL?, to composition: AVMutableComposition) {
        guard let videoURL = videoURL else { return }
        let videoAsset = AVURLAsset(url: videoURL)
        print(videoAsset.duration)
        
        let videoTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        let duration = CMTime(seconds: 0, preferredTimescale: 1000)
        do {
            try videoTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: videoAsset.duration),
                                            of: videoAsset.tracks(withMediaType: .video)[0],
                                            at: .zero)
        } catch {
            print("Error adding video track: \(error.localizedDescription)")
        }
    }
    
    func addAudioofVideoTrack(from videoURL: URL?, to composition: AVMutableComposition) {
        guard let videoURL = videoURL else { return }
        let videoAsset = AVURLAsset(url: videoURL)
        let videoTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        print(videoAsset.duration)
        
        let duration = CMTime(seconds: 0, preferredTimescale: 1000)
        do {
            try videoTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: videoAsset.duration),
                                            of: videoAsset.tracks(withMediaType: .audio)[0],
                                            at: .zero)
        } catch {
            print("Error adding video track: \(error.localizedDescription)")
        }
    }
    
    
    func addAudioTrack(from audioURL: URL?, to composition: AVMutableComposition, duration: CMTime) {
        guard let audioURL = audioURL else { return }
        let audioAsset = AVURLAsset(url: audioURL)
        let audioTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        do {
            try audioTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: duration),
                                            of: audioAsset.tracks(withMediaType: .audio)[0],
                                            at: .zero)
        } catch {
            print("Error adding audio track: \(error.localizedDescription)")
        }
    }
    
    
    func printAudioStartTime() {
        let startTime = audioPlayer?.currentTime
        print("Audio start time: \(startTime)")
    }
    
    func printVideoStartTime() {
        let startTime = CMTimeGetSeconds(videoPlayer?.currentItem?.currentTime() ?? CMTime.zero)
        print("Video start time: \(startTime)")
    }
    
    
}

extension MediaManager: AVCaptureFileOutputRecordingDelegate{
    
    // 레코딩이 시작되면 호출
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        print("actual start")
    }
    
    // 레코딩이 끝나면 호출
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        print("actual end")
        if (error != nil) {
            print("Error recording movie: \(error!.localizedDescription)")
        } else {
            let videoRecorded = outputURL! as URL
            recordEnd?(videoRecorded)
            UISaveVideoAtPathToSavedPhotosAlbum(videoRecorded.path, nil, nil, nil)
        }
    }
}

