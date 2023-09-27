//
//  RecordViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/23.
//

import UIKit

class RecordViewController: BaseViewController {
    
    let recordView = RecordView()
    let mediaManager = MediaManager()
    
    override func loadView() {
        self.view = recordView
    }
    
    var outputURL: URL?
    var backgroundMusic: Data?
    
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
        recordView.recordButton.setImage(UIImage(named: "record.inactivated"), for: .normal)

        DispatchQueue.global().async {
            do {
                let audioData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    completion(audioData)
                }
            } catch {
                print("Error downloading or playing audio: \(error.localizedDescription)")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadAudio(url: testURL!) { data in
            self.recordView.musicTitleLabel.text = "다운로드 완료"
            UIView.transition(with: self.recordView.recordButton, duration: 0.3, options: .transitionCrossDissolve) {
                self.recordView.recordButton.setImage(UIImage(named: "record.start"), for: .normal)
            }
            self.backgroundMusic = data
        }
    }
    
    let testURL = URL(string: "https://artistack.s3.ap-northeast-2.amazonaws.com/video/6df9ec8d-1569-42fb-a086-d98891e187cd.mp4")
    
    @objc func dismissButtonDidTap(){
        dismiss(animated: true)
    }
    
    @objc func swapButtonDidTap(){
        mediaManager.swapCameraType()
    }
    
    @objc func recordButtonDidTap(){
        if mediaManager.videoOutput.isRecording {
            mediaManager.audioPlayer?.pause()
            mediaManager.stopRecording()
            recordView.recordButton.setImage(UIImage(named: "record.start"), for: .normal)
            let vc = CheckRecordViewController()
            navigationController?.pushViewController(vc, animated: false)
        } else {
            mediaManager.playAudio(data: backgroundMusic!)
            mediaManager.startRecording()
            recordView.recordButton.setImage(UIImage(named: "record.stop"), for: .normal)
        }
    }
    
    func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "dismiss"), style: .plain, target: self, action: #selector(dismissButtonDidTap))
    }
    
    override func setProperties() {
        setNavigationBar()
        view.backgroundColor = .black
        recordView.recordButton.addTarget(self, action: #selector(recordButtonDidTap), for: .touchUpInside)
        recordView.cameraSwapButton.addTarget(self, action: #selector(swapButtonDidTap), for: .touchUpInside)
        mediaManager.videoDevice = mediaManager.bestDevice(in: .back)
        recordView.previewlayer.session = mediaManager.captureSession
        mediaManager.setupSession()
    }
}

