//
//  GameViewController.swift
//  BOMB
//
//  Created by Alexander Ischenko on 08.08.2023.
//

import UIKit
import AVFoundation
import AVKit

class GameViewController: UIViewController {
    
    //MARK: - Variables
    
    var timer = Timer()
    var counter = 30
    var audioPlayer: AVPlayer!
    
    var videoPlayer: AVPlayer!
    var videoLayer: AVPlayerLayer!
    var isPause = true
    
    var model: QuestionModel!
    
    private lazy var startButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 40
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var labelText: UILabel = {
        var label = UILabel()
        label.text = "Нажмите «‎Запустить»‎, чтобы начать игру"
        label.font = .boldSystemFont(ofSize: 35)
        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelTimer: UILabel = {
        var label = UILabel()
        label.isHidden = true
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bombView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(startButton)
        view.addSubview(bombView)
        view.addSubview(labelText)
        view.addSubview(labelTimer)
    }
    
    override func viewWillLayoutSubviews() {
        setupContraints()
    }
    
    override func viewDidLayoutSubviews() {
        setupView(with: "bomb", "mp4", selector: #selector(playerItemDidReachEnd1))
    }
    
    //MARK: - Private Methods

    private func setupContraints() {
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
//        bombView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        bombView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -180).isActive = true
        bombView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bombView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bombView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -100).isActive = true
        bombView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        labelText.bottomAnchor.constraint(equalTo: bombView.topAnchor).isActive = true
        labelText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        labelText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc func pressedButton() {
//        startButton.alpha = 0
//        labelText.text = "Назовите вид зимнего спорта"
//        labelTimer.isHidden = false
//        
//        labelTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        labelTimer.topAnchor.constraint(equalTo: bombView.bottomAnchor, constant: 20).isActive = true
//        labelTimer.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        labelTimer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        timer.invalidate()
        
//        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        videoPlayer.play()
    }
    
    @objc func timerAction() {
        
        if counter > 0 {
            soundOfTimer()
            labelTimer.text = "\(counter)"
            counter -= 1
        } else if counter == 0  {
            timer.invalidate()
            soundOfBoom()
            present (GameEndViewController(), animated:  true)
        }
    }
    
    private func soundOfTimer() {
        let url = Bundle.main.url(forResource: "timer", withExtension: "mp3")
        audioPlayer = AVPlayer.init(url: url!)
        audioPlayer.play()
    }
    
    private func soundOfBoom() {
        let url = Bundle.main.url(forResource: "vzryiv-bombyi", withExtension: "mp3")
        audioPlayer = AVPlayer.init(url: url!)
        audioPlayer.play()
    }
    
    private func setupView(with name: String, _ ext: String, selector: Selector) {
        let url = Bundle.main.url(forResource: name, withExtension: ext)!

        videoPlayer = AVPlayer(url: url)
        videoLayer = AVPlayerLayer(player: videoPlayer)
        videoLayer.frame = bombView.bounds
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        bombView.layer.addSublayer(videoLayer)

        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: videoPlayer.currentItem)
    }
    
    
    
    @objc func playerItemDidReachEnd1() {
        videoPlayer.seek(to: .zero) { _ in
            self.counter -= 1
            print(self.counter)
        }
        if counter >= 1 {
            videoPlayer.play()
        } else {
            videoLayer.removeFromSuperlayer()
            setupView(with: "explosion", "mp4", selector: #selector(playerItemDidReachEnd2))
        }
    }
    
    @objc func playerItemDidReachEnd2() {
        videoPlayer.seek(to: .zero) { _ in
            self.videoLayer.removeFromSuperlayer()
        }
    }
    
    deinit {
        print("Bye")
    }
    
}
