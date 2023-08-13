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
        button.titleLabel?.font = UIFont(name: "AcsiomaSuperShockC", size: 25)
        button.layer.cornerRadius = view.frame.height / 20
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
        button.titleLabel?.font = UIFont(name: "AcsiomaSuperShockC", size: 25)
        button.layer.cornerRadius = view.frame.height / 20
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
        label.font = UIFont(name: "AcsiomaSuperShockC", size: 25)
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
        label.textColor = .purple
        label.font = .boldSystemFont(ofSize: 30)
        label.contentMode = .scaleAspectFit
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bangImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "bang")
        image.contentMode = .scaleAspectFit
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
        navigationItem.title = "ИГРА"
    }
    
    private func setupContraints() {
        playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playAgainButton.heightAnchor.constraint(equalToConstant: view.frame.height / 10).isActive = true
        playAgainButton.widthAnchor.constraint(equalToConstant: view.frame.width - 120).isActive = true
        
        nextExerciseButton.bottomAnchor.constraint(equalTo: playAgainButton.topAnchor, constant: -20).isActive = true
        nextExerciseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextExerciseButton.heightAnchor.constraint(equalToConstant: view.frame.height / 10).isActive = true
        nextExerciseButton.widthAnchor.constraint(equalToConstant: view.frame.width - 120).isActive = true
        
        exerciseLabel.bottomAnchor.constraint(equalTo: nextExerciseButton.topAnchor).isActive = true
        exerciseLabel.topAnchor.constraint(equalTo: bangImage.bottomAnchor).isActive = true
        exerciseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        exerciseLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        bangImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bangImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        bangImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bangImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        firstLabel.bottomAnchor.constraint(equalTo: bangImage.topAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        

        
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
