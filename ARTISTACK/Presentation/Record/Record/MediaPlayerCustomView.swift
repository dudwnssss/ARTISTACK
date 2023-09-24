
 //
//  MediaPlayerView.swift
//  Artistack
//
//  Created by 임영준 on 2022/07/20.
//

import UIKit
import AVFoundation

class MediaPlayerView: UIView{
    
    var player: AVQueuePlayer!
    private var playerLayer: AVPlayerLayer!
    private var playerItem: AVPlayerItem!
    private var playerLooper: AVPlayerLooper!
    
    deinit {
        player.pause()
        playerItem = nil
    }
    
    init(frame: CGRect, videoURL: URL) {
        super.init(frame: frame)
        self.clipsToBounds = true
        player = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: player)
        playerItem = AVPlayerItem(url: videoURL)
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.frame = self.layer.bounds
        self.layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func play(){
        player.play()
    }
    
    func pause(){
        player.pause()
    }
    
    func replay() {
        self.player?.seek(to: .zero)
        play()
    }
    
    
}

