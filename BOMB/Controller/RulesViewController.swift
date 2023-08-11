//
//  RulesViewController.swift
//  BOMB
//
//  Created by Дарья Сотникова on 09.08.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let model = RulesModel()
    
        lazy var rulesTitleLabel: UILabel = {
            let label = UILabel(frame: .zero)
            label.text = "Правила Игры"
            label.textColor = UIColor(named: "purple")
            label.font = .boldSystemFont(ofSize: 40)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        lazy var starButtonImage: UIImageView = {
            let image = UIImageView(frame: .zero)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "start-game-rules")
            return image
        }()
    
        lazy var categoriesTitleLabel: UILabel = {
            let label = UILabel(frame: .zero)
            label.text = "Категории"
            label.textColor = UIColor(named: "purple")
            label.font = .boldSystemFont(ofSize: 40)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
   
        func configureNavBar() {
            navigationItem.title = "Помощь"
            navigationController?.navigationBar.barStyle = .default
//            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
            navigationController?.navigationBar.backgroundColor = .white
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.isTranslucent = false
    
            navigationItem.backBarButtonItem?.tintColor = .black
    
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        var lastView: UIView?
        
        var lastContainerView: UIView?
        
        for i in 0...1 {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            for row in model.rulesPageRows {
                let row = make(rowFor: row)
                containerView.addSubview(row)
                
                NSLayoutConstraint.activate([
                    row.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                    row.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    row.topAnchor.constraint(equalTo: lastView?.bottomAnchor ?? containerView.topAnchor) // label.bottom
                ])
                
                lastView = row
            }
            
            scrollView.addSubview(containerView)
            
            NSLayoutConstraint.activate([
                containerView.leadingAnchor.constraint(equalTo: lastContainerView?.trailingAnchor ?? scrollView.contentLayoutGuide.leadingAnchor),
                containerView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor), // label.bottom
                containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor) // label.bottom
            ])
            
            lastContainerView = containerView
            lastView = nil
            
            NSLayoutConstraint.activate([
                containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
            ])
            
            if i == 1, let lastContainerView {
                NSLayoutConstraint.activate([
                    lastContainerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
                ])
            }
        }
    }
    
    func make(rowFor viewModel: RulesCellViewModel) -> UIView {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        switch viewModel {
        case let .imageAndText(image, text):
            let label = UILabel(frame: .zero)
            label.text = text
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .boldSystemFont(ofSize: 22)
            label.textAlignment = .center
            
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            
            container.addSubview(label)
            container.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: container.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 60),
                imageView.widthAnchor.constraint(equalToConstant: 60),
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8),
                label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            ])
            
            guard let image else { break }
            
            imageView.image = image
        case .title(let text):
            let label = UILabel(frame: .zero)
            label.text = text
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .boldSystemFont(ofSize: 40)
            label.textAlignment = .center
            label.textColor = UIColor(named: "purple")
            container.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: container.topAnchor),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 8),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            ])
            
        case .image(let image):
            let imageView = UIImageView(frame: .zero)
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            
            container.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: container.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])
        }
        
        return container
    }
}

