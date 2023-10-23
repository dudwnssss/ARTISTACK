//
//  CheckRecordViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit
import AVFoundation

class CheckRecordViewController: BaseViewController {
    
    let checkRecordView = CheckRecordView()
    let mediaManager = MediaManager()
    
    var video: URL?
    var backgroundMusic: Data?
    var playerItem: AVPlayerItem?
    
    override func loadView() {
        self.view = checkRecordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediaManager.preparePlayer(playerItem: playerItem!)
        replay2()
    }
    
    override func setProperties() {
        view.backgroundColor = Color.black
        setNavigationBar()
        checkRecordView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        checkRecordView.volumeButton.addTarget(self, action: #selector(volumeButtonDidTap), for: .touchUpInside)
        checkRecordView.retakeButton.addTarget(self, action: #selector(retakeButtonDidTap), for: .touchUpInside)
        checkRecordView.replayButton.addTarget(self, action: #selector(replayButtonDidTap), for: .touchUpInside)
    }
    
    @objc func dismissButtonDidTap(){
        navigationController?.dismiss(animated: true)
    }
    
    @objc func completeButtonDidTap(){
        let vc = UploadViewController()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func retakeButtonDidTap(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func replayButtonDidTap(){
        replay2()
    }
    
    @objc func volumeButtonDidTap(){
        let vc = BottomSheetViewController(type: .volume, contentViewController: VolumeViewController())
        present(vc, animated: true)
    }
    
    func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "dismiss"), style: .plain, target: self, action: #selector(dismissButtonDidTap))
    }
    
    func replay(){
        let queue = DispatchQueue.global(qos: .userInteractive)
        guard let video else { return }
        queue.async {
            self.mediaManager.playVideo(url: video, layer: self.checkRecordView.playerLayer)
        }
        if let backgroundMusic {
                self.mediaManager.prepareAudio(data: backgroundMusic)
        }
    }
    
    func replay2(){
        playerItem?.seek(to: .zero)
        mediaManager.playComposition(playerItem: playerItem!, layer: checkRecordView.playerLayer)
    }
}
 
