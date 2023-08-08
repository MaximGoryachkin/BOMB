//
//  GameViewController.swift
//  BOMB
//
//  Created by Alexander Ischenko on 08.08.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    private lazy var startButton: UIButton = {
        var button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.backgroundColor = .purple
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bombImage: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.image = UIImage(named:"gameBomb")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        label.text = "Нажимте Запустить, чтобы начать игру"
        label.textColor = .purple
        label.contentMode = .scaleAspectFill
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textLabel)
        view.addSubview(startButton)
        view.addSubview(bombImage)
        setupConstraints()
        pressedStartButton()

    }
    
    private func setupConstraints() {
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        bombImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bombImage.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: 20).isActive = true
        bombImage.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func pressedStartButton() {
        startButton.addTarget(self, action: #selector(hideButton), for: .touchUpInside)
    }
    
    @objc func hideButton() {
        startButton.isHidden = true
    }
    
    
}
