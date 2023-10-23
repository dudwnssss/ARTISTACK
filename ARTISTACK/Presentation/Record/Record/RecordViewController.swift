//
//  RecordViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/23.
//

import UIKit
import AVFoundation

class RecordViewController: BaseViewController {
    
    let recordView = RecordView()
    let mediaManager = MediaManager()
    var backgroundMusic: Data?
    
    override func loadView() {
        self.view = recordView
    }
    
    var outputURL: URL?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !mediaManager.captureSession.isRunning {
            DispatchQueue.global().async {
                self.mediaManager.captureSession.startRunning()
            }
        }
    }
    
    
    func downloadAudio(url: URL, completion: @escaping (Data) -> Void) {
        recordView.musicTitleLabel.text = "다운로드 시작"
        recordView.recordButton.setImage(Image.recordInactivated, for: .normal)
        DispatchQueue.global().async {
            do {
                let audioData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.backgroundMusic = audioData
                    print(audioData)
                    completion(audioData)
                }
            } catch {
                print("Error downloading or playing audio: \(error.localizedDescription)")
            }
            }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadAudio(url: aimyonURL!) { data in
            self.recordView.musicTitleLabel.text = "다운로드 완료"
            UIView.transition(with: self.recordView.recordButton, duration: 0.3, options: .transitionCrossDissolve) {
                self.recordView.recordButton.setImage(Image.recordStart, for: .normal)
            }
            self.mediaManager.prepareAudio(data: data)
            self.mediaManager.prepareRecording()
        }
         
    }
    
    let circleURL = URL(string: "https://artistack.s3.ap-northeast-2.amazonaws.com/video/6df9ec8d-1569-42fb-a086-d98891e187cd.mp4")
    let loveleeURL = URL(string: "https://artistack.s3.ap-northeast-2.amazonaws.com/video/fd1de8f7-f903-47c7-8c72-e8ca74cd7c77.mp4")
    let aimyonURL = URL(string: "https://artistack.s3.ap-northeast-2.amazonaws.com/video/c99234d2-6d7d-46bd-a06c-651e5f9c83bc.mp4")
    let hyukoh = URL(string: "https://artistack.s3.ap-northeast-2.amazonaws.com/video/ead283ea-6eb1-4b3b-bd96-10724c83c634.mp4")
    let hyukoh2 = URL(string: "https://artistack.s3.ap-northeast-2.amazonaws.com/video/ead283ea-6eb1-4b3b-bd96-10724c83c634.mp4")
    
    @objc func timerButtonDidTap(){
        guard let audioPlayer = mediaManager.audioPlayer else {return}
        if audioPlayer.isPlaying {
            mediaManager.stopAudio()
        } else {
            mediaManager.playAudio()
        }
    }
    
    @objc func dismissButtonDidTap(){
        dismiss(animated: true)
    }
    
    @objc func swapButtonDidTap(){
        mediaManager.swapCameraType()
    }
    
    @objc func recordButtonDidTap(){
        if mediaManager.videoOutput.isRecording {
            let queue = DispatchQueue.global()
            queue.async { [weak self] in
                self?.mediaManager.videoOutput.stopRecording()
                DispatchQueue.main.async {
                    self?.recordView.recordButton.setImage(Image.recordStart, for: .normal)

                }
            }
        } else {
            DispatchQueue.global().async {
                self.mediaManager.playAudio()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: { [weak self] in
                    self?.mediaManager.startRecording()
                })
            }
            recordView.recordButton.setImage(Image.recordStop, for: .normal)
        }
    }
    
    func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Image.dismiss, style: .plain, target: self, action: #selector(dismissButtonDidTap))
    }
    
    override func setProperties() {
        setNavigationBar()
        view.backgroundColor = Color.black
        recordView.recordButton.addTarget(self, action: #selector(recordButtonDidTap), for: .touchUpInside)
        recordView.cameraSwapButton.addTarget(self, action: #selector(swapButtonDidTap), for: .touchUpInside)
        recordView.timerButton.addTarget(self, action: #selector(timerButtonDidTap), for: .touchUpInside)
        mediaManager.videoDevice = mediaManager.bestDevice(in: .back)
        recordView.previewlayer.session = mediaManager.captureSession
        mediaManager.setupSession()
        mediaManager.recordEnd = { [self] data in
            
            outputURL = mediaManager.tempURL()
            let vc = CheckRecordViewController()
            self.mediaManager.merge(audioURL: self.aimyonURL!, videoURL: data, outputURL: outputURL!){ data in
                vc.playerItem = data
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
}

