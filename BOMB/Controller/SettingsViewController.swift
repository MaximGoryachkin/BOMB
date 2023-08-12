//
//  SettingsViewController.swift
//  BOMB
//
//  Created by Дарья Сотникова on 12.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let contentView = UIView(frame: .zero)
    let scrollView = UIScrollView()
    let model = SettingsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Настройки"
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        create(pagesFrom: [model.settingsPageRows])
    }
    
    func create(pagesFrom pages: [[SettingsCellViewModel]]) {
        var lastView: UIView?
        var lastContainerView: UIView?
        
        for (index, page) in pages.enumerated() {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            for row in page {
                let row = make(rowFor: row)
                containerView.addSubview(row)
                
                NSLayoutConstraint.activate([
                    row.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                    row.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    row.topAnchor.constraint(equalTo: lastView?.bottomAnchor ?? containerView.topAnchor)
                ])
                
                lastView = row
            }
            
            if let lastView {
                containerView.bottomAnchor.constraint(equalTo: lastView.bottomAnchor).isActive = true
            }
            
            scrollView.addSubview(containerView)
            
            NSLayoutConstraint.activate([
                containerView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
                containerView.topAnchor.constraint(equalTo: lastContainerView?.bottomAnchor ?? scrollView.contentLayoutGuide.topAnchor),
                containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            ])
            
            lastContainerView = containerView
            lastView = nil
            
            if index == pages.endIndex - 1 {
                containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
            }
        }
    }
    
    func make(rowFor viewModel: SettingsCellViewModel) -> UIView {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false

        switch viewModel {
        case .label(let text):
            let label = UILabel(frame: .zero)
            label.text = text
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
            label.textAlignment = .left
            label.textColor = UIColor(named: "purple")
            
            container.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            ])
            
        case .timing(
            let buttonLeftUp,
            let buttonRightUp,
            let buttonLeftDown,
            let buttonRightDown
        ):
            let leftUp = UIButton(frame: .zero)
            let rightUp = UIButton(frame: .zero)
            let leftDown = UIButton(frame: .zero)
            let rightDown = UIButton(frame: .zero)
            
            leftUp.translatesAutoresizingMaskIntoConstraints = false
            rightUp.translatesAutoresizingMaskIntoConstraints = false
            leftDown.translatesAutoresizingMaskIntoConstraints = false
            rightDown.translatesAutoresizingMaskIntoConstraints = false
            
            leftUp.setTitleColor(.white, for: .normal)
            rightUp.setTitleColor(UIColor(named: "purple") ?? .clear, for: .normal)
            leftDown.setTitleColor(UIColor(named: "purple") ?? .clear, for: .normal)
            rightDown.setTitleColor(UIColor(named: "purple") ?? .clear, for: .normal)
            
            leftUp.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
            rightUp.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
            leftDown.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
            rightDown.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
            
            leftUp.setTitle(buttonLeftUp, for: .normal)
            rightUp.setTitle(buttonRightUp, for: .normal)
            leftDown.setTitle(buttonLeftDown, for: .normal)
            rightDown.setTitle(buttonRightDown, for: .normal)
            
            leftUp.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            rightUp.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            leftDown.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            rightDown.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            
            leftUp.layer.borderWidth = 2
            rightUp.layer.borderWidth = 2
            leftDown.layer.borderWidth = 2
            rightDown.layer.borderWidth = 2
            
            leftUp.layer.cornerRadius = 20
            rightUp.layer.cornerRadius = 20
            leftDown.layer.cornerRadius = 20
            rightDown.layer.cornerRadius = 20
            
            leftUp.isSelected = true
            
            isSelected(button: leftUp)
            isSelected(button: rightUp)
            isSelected(button: leftDown)
            isSelected(button: rightDown)
            
            container.addSubview(leftUp)
            container.addSubview(rightUp)
            container.addSubview(leftDown)
            container.addSubview(rightDown)
            
            NSLayoutConstraint.activate([
                leftUp.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                leftUp.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
                
                rightUp.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                rightUp.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
                
                leftDown.topAnchor.constraint(equalTo: leftUp.bottomAnchor, constant: 8),
                leftDown.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
                
                rightDown.topAnchor.constraint(equalTo: rightUp.bottomAnchor, constant: 8),
                rightDown.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
                
                leftUp.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4),
                rightUp.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4),
                leftDown.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4),
                rightDown.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4),
                
                leftDown.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
                rightDown.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
                
            ])
         
        case .labelAndSwitch(let text, let isSwitched):
            let label = UILabel(frame: .zero)
            let switchSelector = UISwitch(frame: .zero)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = text
            label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
            label.numberOfLines = 0
            label.textColor = UIColor(named: "purple")
            label.setContentHuggingPriority(.defaultLow, for: .horizontal)
            
            switchSelector.isOn = isSwitched
            switchSelector.onTintColor = UIColor(named: "purple")
            switchSelector.translatesAutoresizingMaskIntoConstraints = false
            switchStateDidChange(switchSelector)
            
            container.addSubview(label)
            container.addSubview(switchSelector)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
                
                switchSelector.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                switchSelector.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16),
                switchSelector.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
                switchSelector.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
                
            ])
            
        case .labelAndList(let text, let names):
            let label = UILabel(frame: .zero)
            label.text = text
            label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
            label.numberOfLines = 0
            label.textColor = UIColor(named: "purple")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let button = UIButton(frame: .zero)
            button.setTitle(names[0], for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            
            var children: [UIMenuElement] = []
            
            for name in names {
                let element = UIAction(title: name, handler: { _ in })
                children.append(element)
            }
            
            let menu = UIMenu(children: children)
            
            button.menu = menu
            
            container.addSubview(label)
            container.addSubview(button)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
                
                button.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
                button.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
            ])
        }

        return container
    }
    
    func isSelected(button: UIButton) {
        if button.isSelected {
            button.backgroundColor = UIColor(named: "purple")
            button.titleLabel?.textColor = .white
            print("\(button.titleLabel?.text ?? "") tap")
        } else {
            button.backgroundColor = .white
            button.titleLabel?.textColor = UIColor(named: "purple")
        }
    }
    
    func switchStateDidChange(_ sender: UISwitch) {
        if sender.isOn == true {
            print("switch is on")
        } else {
            print("switch is off")
        }
    }
}
