//
//  GameViewController.swift
//  BOMB
//
//  Created by Alexander Ischenko on 08.08.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - Variables
    
    var timer = Timer()
    var counter = 30
    
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
    
    private lazy var bombImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "gameBomb")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startButton)
        view.addSubview(bombImage)
        view.addSubview(labelText)
        view.addSubview(labelTimer)
        setupContraints()
        
    }
    
    //MARK: - Private Methods

    private func setupContraints() {
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        bombImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bombImage.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -180).isActive = true
        
        labelText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelText.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        labelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        labelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    @objc func pressedButton() {
        startButton.alpha = 0
        labelText.text = "Назовите вид зимнего спорта"
        labelTimer.isHidden = false
        
        labelTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTimer.topAnchor.constraint(equalTo: bombImage.bottomAnchor, constant: 20).isActive = true
        labelTimer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelTimer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        counter -= 1
        labelTimer.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            present(GameEndViewController(), animated: true)
        }
    }
}
