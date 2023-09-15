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
    
    var audioPlayer: AVAudioPlayer?
    
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
        
        present(videoPlayerVC, animated: true) {
            videoPlayerVC.player?.play()
        }
    }
    
    @IBAction func playMusicAction() {
        let actionSheet = UIAlertController(title: "선택", message: "노래 골라", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "1번음악", style: .default) {
           [weak self] a in self?.playMusic(name: "1")
        }
        actionSheet.addAction(action1)
        
        let action2 = UIAlertAction(title: "2번음악", style: .default) {
            [weak self]   a in self?.playMusic(name: "2")
        }
        actionSheet.addAction(action2)
        
        let action3 = UIAlertAction(title: "3번음악", style: .default) {
            [weak self] a in self?.playMusic(name: "3")
        }
        actionSheet.addAction(action3)
        
        present(actionSheet,animated: true)
    }
    
    func playMusic(name: String) {
        print(name)
        let path = Bundle.main.path(forResource: name, ofType: "mp3")
        ?? "" ;
        let url = URL(fileURLWithPath: path)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch {
            print(error.localizedDescription)
        }
    }
}

 
