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
        button.backgroundColor = .purple
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    private lazy var bombImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named:"gameBomb")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.text = "Нажимте Запустить, чтобы начать игру"
        label.textColor = .purple
        label.contentMode = .scaleAspectFill
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()

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

}
