//
//  GameEndViewController.swift
//  BOMB
//
//  Created by Alexander Ischenko on 09.08.2023.
//

import UIKit

class GameEndViewController: UIViewController {
    
    var model: QuestionModel!

    private lazy var playAgainButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Начать заново", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 40
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(reloadGame), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextExerciseButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Другое задание", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
//        button.configuration?.titleLineBreakMode = .byWordWrapping
        button.layer.cornerRadius = 40
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(setNextPunishment), for: .touchUpInside)
        return button
    }()
    
    private lazy var firstLabel: UILabel = {
        var label = UILabel()
        label.text = "Проигравший выполняет задание"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        label.contentMode = .scaleAspectFit
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exerciseLabel: UILabel = {
        var label = UILabel()
        label.text = model.setPunishment()
        label.textColor = .systemMint
        label.font = .boldSystemFont(ofSize: 35)
        label.contentMode = .scaleAspectFit
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bangImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "bang")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(playAgainButton)
        view.addSubview(nextExerciseButton)
        view.addSubview(firstLabel)
        view.addSubview(exerciseLabel)
        view.addSubview(bangImage)
        setupContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupContraints() {
        playAgainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playAgainButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        playAgainButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        nextExerciseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextExerciseButton.bottomAnchor.constraint(equalTo: playAgainButton.topAnchor, constant: -20).isActive = true
        nextExerciseButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nextExerciseButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exerciseLabel.bottomAnchor.constraint(equalTo: nextExerciseButton.topAnchor, constant: -30).isActive = true
        exerciseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        exerciseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

        bangImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bangImage.bottomAnchor.constraint(equalTo: exerciseLabel.topAnchor, constant: -30).isActive = true
        
    }
    
    @objc func reloadGame() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func setNextPunishment() {
        exerciseLabel.text = model.setPunishment()
    }
    
    deinit {
        print("bye")
    }
    
}
