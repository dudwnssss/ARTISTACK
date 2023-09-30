//
//  AudioManager.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/30.
//

import AVFoundation

class AudioPlayer {
    private var audioEngine: AVAudioEngine = AVAudioEngine()
    private var audioPlayerNode: AVAudioPlayerNode = AVAudioPlayerNode()
    private var buffer: AVAudioPCMBuffer?
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    lazy var mp4FileURL = documentsURL.appendingPathComponent("ThisIsDisposable.mp4")
    
    init() {
    }
    
    func setupAudioEngine() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, options: .defaultToSpeaker)
            try audioSession.setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
        
        // Load the audio file and create a buffer
        guard let audioFile = try? AVAudioFile(forReading: mp4FileURL) else {
            print("Error loading audio file")
            return
        }
        
        let format = audioFile.processingFormat
        let frameCount = UInt32(audioFile.length)
        buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frameCount)
        
        do {
            try audioFile.read(into: buffer!)
        } catch {
            print("Error reading audio file into buffer: \(error.localizedDescription)")
        }
        
        // Attach and connect nodes, prepare audio engine
        audioEngine.attach(audioPlayerNode)
        audioEngine.connect(audioPlayerNode, to: audioEngine.mainMixerNode, format: format)
        
        do {
            try audioEngine.start()
        } catch {
            print("Error starting audio engine: \(error.localizedDescription)")
        }
        
        guard let buffer = buffer else {
            print("Audio buffer not available")
            return
        }
        
        audioPlayerNode.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
    }
    
    func playAudio() {
       
        audioPlayerNode.play()
    }
    
    func stopAudio() {
        audioPlayerNode.stop()
    }
    
    func downloadMP4File(from url: URL, completion: @escaping (URL?) -> Void) {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url) { [self] (tempLocalURL, response, error) in
            if let error = error {
                completion(nil)
                return
            }
            
            guard let tempLocalURL = tempLocalURL else {
                let downloadError = NSError(domain: "DownloadError", code: -1, userInfo: nil)
                completion(nil)
                return
            }
            
            do {
                let fileManager = FileManager.default
                try? fileManager.removeItem(at: mp4FileURL)
                try fileManager.moveItem(at: tempLocalURL, to: mp4FileURL)
                completion(mp4FileURL)
            } catch {
                completion(nil)
            }
        }
        
        downloadTask.resume()
    }

    
}



