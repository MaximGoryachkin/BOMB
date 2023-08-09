//
//  ViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let diameterBtn: CGFloat = 80
        
        //add background image
        let imageBackgroundView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        let backgroundImage = UIImage(named: "background")
        imageBackgroundView.image = backgroundImage
        view.addSubview(imageBackgroundView)
        
        //add imageLogoView
        let imageLogoView = UIImageView()
        imageLogoView.translatesAutoresizingMaskIntoConstraints = false
        imageLogoView.frame.origin.x = 100
        imageLogoView.frame.origin.y = 100
        imageLogoView.frame.size.height = 300
        imageLogoView.frame.size.width = imageLogoView.frame.size.height
        view.addSubview(imageLogoView)
        
        //add logo image
        let logoImage = UIImage(named: "startImage")
        imageLogoView.image = logoImage
       
        //add settings button
        let settingsBtn = UIButton()
        settingsBtn.backgroundColor = .red
        settingsBtn.frame.size.width = diameterBtn
        settingsBtn.frame.size.height = diameterBtn
        settingsBtn.layer.cornerRadius = settingsBtn.frame.width/2
        settingsBtn.setTitle("1", for: .normal)
        settingsBtn.addTarget(self, action: #selector(self.settingsGameBtn), for: .touchUpInside)

        //add help button
        let helpBtn = UIButton()
        helpBtn.backgroundColor = .green
        helpBtn.frame.size.width = diameterBtn
        helpBtn.frame.size.height = diameterBtn
        helpBtn.layer.cornerRadius = helpBtn.frame.width/2
        helpBtn.setTitle("2", for: .normal)
        helpBtn.addTarget(self, action: #selector(self.helpGameBtn), for: .touchUpInside)

        //add stackView for settings and help buttons
        let stackBtnView = UIStackView()
        stackBtnView.axis = .horizontal
        stackBtnView.distribution = .equalCentering
        stackBtnView.alignment = .center
        stackBtnView.spacing = 0
        stackBtnView.addArrangedSubview(settingsBtn)
        stackBtnView.addArrangedSubview(helpBtn)
        imageBackgroundView.addSubview(stackBtnView)
        stackBtnView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            //Logo constraints
            imageLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            //StackView constraints
            stackBtnView.bottomAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: -50),
            stackBtnView.leadingAnchor.constraint(equalTo: imageBackgroundView.leadingAnchor, constant: 30),
            stackBtnView.trailingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: -30),
            
            //Settings button constraints
            settingsBtn.heightAnchor.constraint(equalToConstant: diameterBtn),
            settingsBtn.widthAnchor.constraint(equalToConstant: diameterBtn),
            
            //Help button constraints
            helpBtn.heightAnchor.constraint(equalToConstant: diameterBtn),
            helpBtn.widthAnchor.constraint(equalToConstant: diameterBtn),
        ])
        
        
        
        
    }
    
    @objc func newGameBtn(){
        
    }
    
    @objc func continueGameBtn(){
        
    }
    
    @objc func categoriesGameBtn(){
        
    }
    
    @objc func settingsGameBtn(){
        print("Settings")
    }
    
    @objc func helpGameBtn(){
        print("Help")
    }
    
}

