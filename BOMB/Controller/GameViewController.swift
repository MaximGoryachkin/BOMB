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
    
    var roundTime = 5.0
    let timeInterval = 0.1
    var animationInPause = false
    var animationIsEnd = false
    var timer: Timer!
    var audioPlayer: AVPlayer!
    var videoPlayer: AVPlayer!
    var videoLayer: AVPlayerLayer!
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        startButton.isHidden = false
        animationInPause = false
        animationIsEnd = false
        roundTime = 5
        navigationItem.setRightBarButton(UIBarButtonItem(), animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        videoPlayer.pause()
        audioPlayer.pause()
        timer.invalidate()
    }
    
    //MARK: - Private Methods
    
    private func setupContraints() {
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
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
        prepareVideoPlayer(with: "bomb", "mp4", selector: #selector(beginGame))
        prepareAudioPlayer(with: "timer", "mp3")
        startButton.isHidden.toggle()
        labelText.text = model.setQuestion()
        
        let barItem = UIBarButtonItem(image: UIImage(systemName: "pause.circle.fill"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(pauseDidTapped))
        navigationItem.setRightBarButton(barItem, animated: false)
        
        timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                     target: self,
                                     selector: #selector(decrementTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func decrementTimer() {
        print(roundTime)
        if roundTime > timeInterval {
            roundTime -= timeInterval
        } else {
            timer.invalidate()
            bombWillExplose()
        }
    }
    
    private func bombWillExplose() {
        videoLayer.removeFromSuperlayer()
        prepareVideoPlayer(with: "explosion", "mp4", selector: #selector(bombExplodes))
        prepareAudioPlayer(with: "explosion", "mp3")
    }
    
    private func prepareAudioPlayer(with name: String, _ ext: String) {
        let url = Bundle.main.url(forResource: name, withExtension: ext)
        audioPlayer = AVPlayer(url: url!)
        audioPlayer.play()
    }
    
    private func prepareVideoPlayer(with name: String, _ ext: String, selector: Selector) {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else { return }
        videoPlayer = AVPlayer(url: url)
        videoLayer = AVPlayerLayer(player: videoPlayer)
        videoLayer.frame = bombView.bounds
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        bombView.layer.addSublayer(videoLayer)
        videoPlayer.play()
        
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: videoPlayer.currentItem)
    }
    
    @objc func beginGame() {
        videoPlayer.seek(to: .zero)
        if timer.isValid {
            videoPlayer.play()
        }
    }
    
    @objc func bombExplodes() {
        videoPlayer.seek(to: .zero) { _ in
            self.videoLayer.removeFromSuperlayer()
            self.animationIsEnd.toggle()
            let gameEndVC = GameEndViewController()
            self.navigationController?.pushViewController(gameEndVC, animated: false)
        }
    }
    
    @objc func pauseDidTapped() {
        if !animationInPause {
            videoPlayer.pause()
            audioPlayer.pause()
            animationInPause.toggle()
            timer.invalidate()
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.circle.fill")
        } else {
            videoPlayer.play()
            audioPlayer.play()
            animationInPause.toggle()
            timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                         target: self,
                                         selector: #selector(decrementTimer),
                                         userInfo: nil,
                                         repeats: true)
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.circle.fill")
        }
    }
    
    @objc func goToMainVC() {
        videoPlayer.pause()
        audioPlayer.pause()
    }
    
    deinit {
        print("deinit gamevc")
    }
    
}
