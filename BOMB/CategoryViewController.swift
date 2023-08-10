//
//  SecondViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import AVFoundation
import AVKit
import UIKit

class CategoryViewController: UIViewController {
    
    var player: AVPlayer!
    let someView = UIView()
    var delegate: CheckCategoryProtocol?
    var counter = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        someView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "КАТЕГОРИИ"
    }
    
    @objc func changeCategory(_ sender: UIButton) {
        guard let name = sender.titleLabel?.text else { return }
        delegate?.updateModel(for: name)
    }
    
    private func setupView() {
        guard let url = Bundle.main.url(forResource: "video", withExtension: "mp4") else { return }
        player = AVPlayer(url: url)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem) // Add observer
        
        let videoLayer = AVPlayerLayer(player: player)
        videoLayer.frame = self.view.bounds
        view.layer.addSublayer(videoLayer)
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        
        player.play()
        
    }
    
    deinit {
        print("Bye")
    }
    
    @objc func playerItemDidReachEnd() {
        player.seek(to: .zero) { _ in
            self.counter -= 1
            print(self.counter)
        }
        if counter > 1 {
            self.player.play()
        }
    }
}


