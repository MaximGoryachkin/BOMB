//
//  ViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    let diameterBtn: CGFloat = 60
    let heightBtn: CGFloat = 50
    let widthBtn: CGFloat = 200
    let btnsHeightText: CGFloat = 25
    
    var model = QuestionModel()
    
    //add settings button
    lazy var settingsBtn: AnimationButtons = {
        let newSettingsButton = AnimationButtons()
        newSettingsButton.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        newSettingsButton.frame.size.width = diameterBtn
        newSettingsButton.frame.size.height = diameterBtn
        newSettingsButton.layer.cornerRadius = newSettingsButton.frame.width/2
        newSettingsButton.layer.borderWidth = 3.0
        newSettingsButton.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        let logoSettingsImage = UIImage(named: "settings")
        newSettingsButton.setImage(logoSettingsImage, for: .normal)
        //newSettingsButton.setTitle("1", for: .normal)
        newSettingsButton.addTarget(self, action: #selector(settingsGameBtn), for: .touchUpInside)
        return newSettingsButton
    }()
    
    //add help button
    lazy var helpBtn: AnimationButtons = {
        let newHelpButton = AnimationButtons()
        newHelpButton.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        newHelpButton.frame.size.width = diameterBtn
        newHelpButton.frame.size.height = diameterBtn
        newHelpButton.layer.cornerRadius = newHelpButton.frame.width/2
        newHelpButton.layer.borderWidth = 3.0
        newHelpButton.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        let logoQestImage = UIImage(named: "qest")
        newHelpButton.setImage(logoQestImage, for: .normal)
        //newHelpButton.setTitle("2", for: .normal)
        newHelpButton.addTarget(self, action: #selector(helpGameBtn), for: .touchUpInside)
        return newHelpButton
    }()
    
    //add new game button
    lazy var gameBtn: AnimationButtons = {
        let newGameButton = AnimationButtons()
        newGameButton.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        newGameButton.frame.size.width = widthBtn
        newGameButton.frame.size.height = heightBtn
        newGameButton.layer.cornerRadius = newGameButton.frame.height/2
        newGameButton.layer.borderWidth = 3.0
        newGameButton.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        newGameButton.setTitle("новая игра", for: .normal)
        newGameButton.titleLabel?.textAlignment = .center
        newGameButton.setTitleColor(.yellow, for: .normal)
        newGameButton.titleLabel?.font = UIFont(name: "AcsiomaSuperShockC", size: btnsHeightText)
        newGameButton.addTarget(self, action: #selector(newGameBtn), for: .touchUpInside)
        return newGameButton
    }()
    
    //add continue game button
    lazy var continueBtn: AnimationButtons = {
        let continueGameButton = AnimationButtons()
        continueGameButton.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        continueGameButton.frame.size.width = widthBtn
        continueGameButton.frame.size.height = heightBtn
        continueGameButton.layer.cornerRadius = continueGameButton.frame.height/2
        continueGameButton.layer.borderWidth = 3.0
        continueGameButton.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        continueGameButton.setTitle("продолжить", for: .normal)
        continueGameButton.titleLabel?.textAlignment = .center
        continueGameButton.setTitleColor(.yellow, for: .normal)
        continueGameButton.titleLabel?.font = UIFont(name: "AcsiomaSuperShockC", size: btnsHeightText)
        continueGameButton.addTarget(self, action: #selector(continueGameBtn), for: .touchUpInside)
        return continueGameButton
    }()
    
    //add categories game button
    lazy var categoriesBtn: AnimationButtons = {
        let categoriesGameButton = AnimationButtons()
        categoriesGameButton.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesGameButton.frame.size.width = widthBtn
        categoriesGameButton.frame.size.height = heightBtn
        categoriesGameButton.layer.cornerRadius = categoriesGameButton.frame.height/2
        categoriesGameButton.layer.borderWidth = 3.0
        categoriesGameButton.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesGameButton.setTitle("категории", for: .normal)
        categoriesGameButton.titleLabel?.textAlignment = .center
        categoriesGameButton.setTitleColor(.yellow, for: .normal)
        categoriesGameButton.titleLabel?.font = UIFont(name: "AcsiomaSuperShockC", size: btnsHeightText)
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
        stackVerticalView.backgroundColor = .clear //free
        stackVerticalView.translatesAutoresizingMaskIntoConstraints = false
        return stackVerticalView
    } ()
    
    lazy var stackHorizView: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        stackHorizontalView.alignment = .center
        stackHorizontalView.spacing = 50
        stackHorizontalView.backgroundColor = .clear //free
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    
    lazy var boombLable: UILabel = {
        let boomb = UILabel()
        boomb.frame.size.width = 200
        boomb.frame.size.height = 30
        boomb.textAlignment = .center
        boomb.text = "БОМБА"
        let gradient = UIImage.gImage(frame: boomb.bounds, colors: [UIColor(red: 0x2A, green: 0x14, blue: 0x68), UIColor(red: 0xAC, green: 0x49, blue: 0xFF), .white])
        boomb.textColor = UIColor.init(patternImage: gradient)
        boomb.font = UIFont(name: "AcsiomaSuperShockC", size: 70)
        return boomb
    }()
    
    lazy var boombLableSecond: UILabel = {
        let boombText = UILabel()
        boombText.text = "игра для компании"
        boombText.textColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        boombText.font = UIFont(name: "AcsiomaSuperShockC", size: 25)
        return boombText
    }()
    
    lazy var stackVertImageView: UIStackView = {
        let stackVerticalIV = UIStackView()
        stackVerticalIV.axis = .vertical
        stackVerticalIV.distribution = .equalCentering
        stackVerticalIV.alignment = .center
        stackVerticalIV.spacing = 10
        stackVerticalIV.backgroundColor = .clear //free
        stackVerticalIV.translatesAutoresizingMaskIntoConstraints = false
        return stackVerticalIV
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews(views: background, stackVertView, stackHorizView, settingsBtn, helpBtn)
        addViewInStack(stack: stackVertView, views: logo, gameBtn, continueBtn,categoriesBtn, stackHorizView)
        addViewInStack(stack: stackHorizView, views: settingsBtn, helpBtn)
        logo.addSubview(stackVertImageView)
        addViewInStack(stack: stackVertImageView, views: boombLable, boombLableSecond)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //stackVertView constraint (super stack)
        NSLayoutConstraint.activate([
            stackVertView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackVertView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackVertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackVertView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        //stackVertImageView constraint (boombLable, boombLableSecond)
        NSLayoutConstraint.activate([
            stackVertImageView.trailingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 0),
            stackVertImageView.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 0),
            stackVertImageView.bottomAnchor.constraint(equalTo: logo.bottomAnchor, constant: 0),
            boombLableSecond.bottomAnchor.constraint(equalTo: stackVertImageView.bottomAnchor, constant: 0),
            boombLable.bottomAnchor.constraint(equalTo: boombLableSecond.topAnchor, constant: 10),
        ])
        //stackVertView - constraint (logo Bomb, gameBtn, continueBtn, categoriesBtn, stackHorizView)
        NSLayoutConstraint.activate([
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
        ])
        //stackHorizView constraint (settingsBtn, helpBtn)
        NSLayoutConstraint.activate([
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
    }
    
    func addViews(views: UIView...) {
        for view in views {
            self.view.addSubview(view)
        }
    }
    
    func addViewInStack(stack: UIStackView, views: UIView...) {
        for view in views {
            stack.addArrangedSubview(view)
        }
    }
    
    @objc func newGameBtn(){
        let gameVC = GameViewController()
        gameVC.model = self.model
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func continueGameBtn(){
        print("continueGame")
    }
    
    @objc func categoriesGameBtn(){
        let categoryVC = CategoryViewController()
        //categoryVC.delegate = self
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    @objc func settingsGameBtn(){
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc func helpGameBtn(){
        let rulesVC = RulesViewController()
        navigationController?.pushViewController(rulesVC, animated: true)
    }
    
}

extension MainViewController: CheckCategoryProtocol {
    func updateModel(for name: String) {
        model.update(categoryName: name)
    }
}
