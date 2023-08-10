//
//  ViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit


class MainViewController: UIViewController {
    
    var model = QuestionModel()
    
    let diameterBtn: CGFloat = 60
    let heightBtn: CGFloat = 50
    let widthBtn: CGFloat = 200
    
    //add settings button
    lazy var settingsBtn: UIButton = {
        let newSettingsButton = UIButton()
        newSettingsButton.backgroundColor = UIColor.red
        newSettingsButton.frame.size.width = diameterBtn
        newSettingsButton.frame.size.height = diameterBtn
        newSettingsButton.layer.cornerRadius = newSettingsButton.frame.width/2
        newSettingsButton.setTitle("1", for: .normal)
        newSettingsButton.addTarget(self, action: #selector(settingsGameBtn), for: .touchUpInside)
        return newSettingsButton
    }()
    
    //add help button
    lazy var helpBtn: UIButton = {
        let newHelpButton = UIButton()
        newHelpButton.backgroundColor = UIColor.green
        newHelpButton.frame.size.width = diameterBtn
        newHelpButton.frame.size.height = diameterBtn
        newHelpButton.layer.cornerRadius = newHelpButton.frame.width/2
        newHelpButton.setTitle("2", for: .normal)
        newHelpButton.addTarget(self, action: #selector(helpGameBtn), for: .touchUpInside)
        return newHelpButton
    }()
    
    //add new game button
    lazy var gameBtn: UIButton = {
        let newGameButton = UIButton()
        newGameButton.backgroundColor = UIColor.magenta
        newGameButton.frame.size.width = widthBtn
        newGameButton.frame.size.height = heightBtn
        newGameButton.layer.cornerRadius = newGameButton.frame.height/2
        newGameButton.setTitle("новая игра", for: .normal)
        newGameButton.addTarget(self, action: #selector(newGameBtn), for: .touchUpInside)
        return newGameButton
    }()
    
    //add continue game button
    lazy var continueBtn: UIButton = {
        let continueGameButton = UIButton()
        continueGameButton.backgroundColor = UIColor.magenta
        continueGameButton.frame.size.width = widthBtn
        continueGameButton.frame.size.height = heightBtn
        continueGameButton.layer.cornerRadius = continueGameButton.frame.height/2
        continueGameButton.setTitle("продолжить", for: .normal)
        continueGameButton.addTarget(self, action: #selector(continueGameBtn), for: .touchUpInside)
        return continueGameButton
    }()
    
    //add categories game button
    lazy var categoriesBtn: UIButton = {
        let categoriesGameButton = UIButton()
        categoriesGameButton.backgroundColor = UIColor.magenta
        categoriesGameButton.frame.size.width = widthBtn
        categoriesGameButton.frame.size.height = heightBtn
        categoriesGameButton.layer.cornerRadius = categoriesGameButton.frame.height/2
        categoriesGameButton.setTitle("категории", for: .normal)
        categoriesGameButton.addTarget(self, action: #selector(categoriesGameBtn), for: .touchUpInside)
        return categoriesGameButton
    }()
    
    lazy var background: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.frame.size.width = view.frame.width
        backgroundImageView.frame.size.height = view.frame.height
        let background = UIImage(named: "background")
        backgroundImageView.image = background
        //self.view.addSubview(backgroundImageView)
        return backgroundImageView
    }()
    
    lazy var logo: UIImageView = {
        let imageLogoView = UIImageView()
        imageLogoView.frame.size.width = 300
        imageLogoView.frame.size.height = imageLogoView.frame.width
        let logoImage = UIImage(named: "startImage")
        imageLogoView.image = logoImage
        //self.view.addSubview(imageLogoView)
        return imageLogoView
    }()
    
    lazy var stackVertView: UIStackView = {
        let stackVerticalView = UIStackView()
        stackVerticalView.axis = .vertical
        stackVerticalView.distribution = .equalCentering
        stackVerticalView.alignment = .center
        stackVerticalView.spacing = 10
        stackVerticalView.backgroundColor = .green
        //self.view.addSubview(stackVerticalView)
        return stackVerticalView
    } ()
    
    lazy var stackHorizView: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        stackHorizontalView.alignment = .center
        stackHorizontalView.spacing = 50
        stackHorizontalView.backgroundColor = .blue
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    
    lazy var boombLable: UILabel = {
        let boomb = UILabel()
        boomb.frame.size.width = 200
        boomb.frame.size.height = 30
        boomb.textAlignment = .center
        boomb.text = "БОМБА"
        boomb.font = UIFont(name: "Chalkduster", size: 50)
        return boomb
    }()
    
    lazy var boombLableSecond: UILabel = {
        let boombText = UILabel()
        boombText.text = "игра для компании"
        boombText.font = UIFont(name: "Chalkduster", size: 17)
        return boombText
    }()
    
    lazy var stackVertImageView: UIStackView = {
        let stackVerticalIV = UIStackView()
        stackVerticalIV.axis = .vertical
        stackVerticalIV.distribution = .equalCentering
        stackVerticalIV.alignment = .center
        stackVerticalIV.spacing = 10
        stackVerticalIV.backgroundColor = .red
        return stackVerticalIV
    } ()
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        view.addSubview(background)
        view.addSubview(stackVertView)
        stackVertView.addArrangedSubview(logo)
        logo.addSubview(stackVertImageView)
        stackVertImageView.translatesAutoresizingMaskIntoConstraints = false
        stackVertImageView.addArrangedSubview(boombLable)
        stackVertImageView.addArrangedSubview(boombLableSecond)
        stackVertView.addArrangedSubview(gameBtn)
        stackVertView.addArrangedSubview(continueBtn)
        stackVertView.addArrangedSubview(categoriesBtn)
        view.addSubview(stackHorizView)
        stackVertView.addArrangedSubview(stackHorizView)
        view.addSubview(settingsBtn)
        view.addSubview(helpBtn)
        stackHorizView.addArrangedSubview(settingsBtn)
        stackHorizView.addArrangedSubview(helpBtn)
        stackVertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackVertView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackVertView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackVertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackVertView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackVertImageView.trailingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 0),
            stackVertImageView.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 0),
            stackVertImageView.bottomAnchor.constraint(equalTo: logo.bottomAnchor, constant: 0),
            boombLableSecond.bottomAnchor.constraint(equalTo: stackVertImageView.bottomAnchor, constant: 0),
            boombLable.bottomAnchor.constraint(equalTo: boombLableSecond.topAnchor, constant: 10),
            logo.topAnchor.constraint(equalTo: stackVertView.topAnchor, constant: 20),
            gameBtn.widthAnchor.constraint(equalToConstant: widthBtn),
            gameBtn.heightAnchor.constraint(equalToConstant: heightBtn),
            gameBtn.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            continueBtn.widthAnchor.constraint(equalToConstant: widthBtn),
            continueBtn.heightAnchor.constraint(equalToConstant: heightBtn),
            continueBtn.topAnchor.constraint(equalTo: gameBtn.bottomAnchor, constant: 20),
            categoriesBtn.widthAnchor.constraint(equalToConstant: widthBtn),
            categoriesBtn.heightAnchor.constraint(equalToConstant: heightBtn),
            categoriesBtn.topAnchor.constraint(equalTo: continueBtn.bottomAnchor, constant: 20),
            stackHorizView.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 25),
            stackHorizView.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: -25),
            stackHorizView.bottomAnchor.constraint(equalTo: stackVertView.bottomAnchor, constant: 0),
            stackHorizView.heightAnchor.constraint(equalToConstant: diameterBtn),
            settingsBtn.heightAnchor.constraint(equalToConstant: diameterBtn),
            settingsBtn.widthAnchor.constraint(equalToConstant: diameterBtn),
            helpBtn.heightAnchor.constraint(equalToConstant: diameterBtn),
            helpBtn.widthAnchor.constraint(equalToConstant: diameterBtn)
        ])

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Категория"
    }
    
    @objc func newGameBtn(){
        print("newGame")
    }
    
    @objc func continueGameBtn(){
        print("continueGame")
    }
    
    @objc func categoriesGameBtn(){
        let categoryVC = CategoryViewController()
        categoryVC.delegate = self
        navigationController?.pushViewController(categoryVC, animated: true)
        print("categoriesGame")
    }
    
    @objc func settingsGameBtn(){
        print("settingsGame")
    }
    
    @objc func helpGameBtn(){
        print("Help")
    }
    
}

extension MainViewController: CheckCategoryProtocol {
    func updateModel(for name: String) {
        model.update(categoryName: name)
    }
}
