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
    
    var roundTime = 5
    var timer: Timer!
    var audioPlayer: AVPlayer!
    var videoPlayer: AVPlayer!
    var videoLayer: AVPlayerLayer!
    var isPause = false
    var bombAmimationIsEnd = false
    var animationIsEnd = false
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareVideoPlayer(with: "bomb", "mp4", selector: #selector(beginGame))
        print("GameVC Did Layout")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        startButton.isHidden = false
        isPause = false
        bombAmimationIsEnd = false
        animationIsEnd = false
        navigationItem.setRightBarButton(UIBarButtonItem(), animated: false)
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
        videoPlayer.play()
        startButton.isHidden.toggle()
        labelText.text = "Назовите вид зимнего спорта"

        let barItem = UIBarButtonItem(image: UIImage(systemName: "pause.circle.fill"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(pauseDidTapped))
        navigationItem.setRightBarButton(barItem, animated: false)
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(roundTime), target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
    }
    
    @objc func timerAction() {
        bombAmimationIsEnd = timer.isValid
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
        
        if bombAmimationIsEnd {
            videoPlayer.play()
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: videoPlayer.currentItem)
    }
    
    @objc func beginGame() {
        videoPlayer.seek(to: .zero)
        if !bombAmimationIsEnd {
            videoPlayer.play()
        } else {
            videoLayer.removeFromSuperlayer()
            prepareVideoPlayer(with: "explosion", "mp4", selector: #selector(bombExplodes))
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
        if !isPause {
            videoPlayer.pause()
            isPause.toggle()
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.circle.fill")
        } else {
            videoPlayer.play()
            isPause.toggle()
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.circle.fill")
        }
    }
    
    deinit {
        print("Bye")
    }
    
}
