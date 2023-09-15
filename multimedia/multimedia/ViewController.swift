//
//  ViewController.swift
//  multimedia
//
//  Created by kimgyeoll on 2023/09/01.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func prevButtonAction(_ sender: UIButton) {
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = 2
        }
        pictureImageView.image = UIImage(named: "\(currentIndex)")
    }
    
    @IBAction func nextButtonAction() {
        currentIndex += 1
        if currentIndex > 2 {
            currentIndex = 0
        }
        pictureImageView.image = UIImage(named: "\(currentIndex)")
    }
    
    @IBAction func playMoiveAction() {
        let videoPlayerVC = AVPlayerViewController()
        let path = Bundle.main.path(forResource: "S1", ofType: "MP4")
        ?? "";
        
        let url : URL = URL(fileURLWithPath: path)
        videoPlayerVC.player = AVPlayer(url: url)
        
        present(videoPlayerVC, animated: true){
            videoPlayerVC.player?.play()
        }
    }
}

