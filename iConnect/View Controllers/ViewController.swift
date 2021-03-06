//
//  ViewController.swift
//  iConnect
//
//  Created by Maxim Zvenigorodsky on 22.10.2020.
//

import UIKit
import FirebaseDatabase
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    private var looper: AVPlayerLooper?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set up video in the background
        setUpVideo()
    }

    func setUpElements() {
        
        // Style elements
        Utilities.styleFieldButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    func setUpVideo() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "bg2", ofType: "mp4")

        guard bundlePath != nil else { return }

        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)

        // Create the video player iyem
        let item = AVPlayerItem(url: url)

        // Create the player
        videoPlayer = AVPlayer(playerItem: item)

        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0,
                                        width: self.view.frame.size.width*4,
                                        height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)

        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
        videoPlayer!.play()
        
        
//        let asset = AVAsset(url: URL.init(fileURLWithPath: "bg2.mp4"))
//        let item = AVPlayerItem(asset: asset)
//        let player = AVQueuePlayer(playerItem: item)
//        videoLooper = AVPlayerLooper(player: player, templateItem: item)
        
    }
}
