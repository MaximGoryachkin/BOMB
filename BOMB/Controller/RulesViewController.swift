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
//            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        createRulesScreen()
        createCategoriesScreen()
    }
    
    
    func createRulesScreen() {
        
        var lastView: UIView?
        var lastContainerView: UIView?
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        for row in model.rulesPageRows {
            let row = make(rowFor: row)
            containerView.addSubview(row)
            
            NSLayoutConstraint.activate([
                row.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                row.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                row.topAnchor.constraint(equalTo: lastView?.bottomAnchor ?? containerView.topAnchor)
            ])
            
            lastView = row
        }
        
        scrollView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: lastContainerView?.trailingAnchor ?? scrollView.contentLayoutGuide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor)
        ])
        
        lastContainerView = containerView
        lastView = nil
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
    }
    
    func createCategoriesScreen() {
        var lastView: UIView?
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        for row in model.categoriesPageRows {
            let row = make(rowFor: row)
            containerView.addSubview(row)
            
            NSLayoutConstraint.activate([
                row.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                row.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                row.topAnchor.constraint(equalTo: lastView?.bottomAnchor ?? containerView.topAnchor)
            ])
            
            lastView = row
        }
        
        scrollView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.subviews.first?.trailingAnchor ?? scrollView.contentLayoutGuide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor)
        ])
    
        lastView = nil
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
    }
    
    func make(rowFor viewModel: RulesCellViewModel) -> UIView {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let categoryContainerLeft = UIView(frame: .zero)
        categoryContainerLeft.backgroundColor = UIColor(named: "purple") ?? UIColor()
        categoryContainerLeft.translatesAutoresizingMaskIntoConstraints = false
        categoryContainerLeft.layer.cornerRadius = 50
        
        let categoryContainerRight = UIView(frame: .zero)
        categoryContainerRight.backgroundColor = UIColor(named: "purple") ?? UIColor()
        categoryContainerRight.translatesAutoresizingMaskIntoConstraints = false
        categoryContainerRight.layer.cornerRadius = 50
        
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
            
        case .twoImagesLabel(left: let left, right: let right):
            let titleLeft = UILabel(frame: .zero)
            let titleRight = UILabel(frame: .zero)
            titleLeft.text = left?.0
            titleRight.text = right?.0
            titleLeft.textColor = .white
            titleRight.textColor = .white
            titleLeft.font = .boldSystemFont(ofSize: 20)
            titleRight.font = .boldSystemFont(ofSize: 20)
            titleLeft.textAlignment = .center
            titleRight.textAlignment = .center
            titleLeft.numberOfLines = 0
            titleRight.numberOfLines = 0
            titleLeft.translatesAutoresizingMaskIntoConstraints = false
            titleRight.translatesAutoresizingMaskIntoConstraints = false
            
            let emojiLeft = UILabel(frame: .zero)
            let emojiRight = UILabel(frame: .zero)
            emojiLeft.text = left?.1
            emojiRight.text = right?.1
            emojiLeft.font = .boldSystemFont(ofSize: 60)
            emojiRight.font = .boldSystemFont(ofSize: 60)
            emojiLeft.translatesAutoresizingMaskIntoConstraints = false
            emojiRight.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(categoryContainerLeft)
            container.addSubview(categoryContainerRight)
            categoryContainerLeft.addSubview(titleLeft)
            categoryContainerLeft.addSubview(emojiLeft)
            categoryContainerRight.addSubview(titleRight)
            categoryContainerRight.addSubview(emojiRight)
            
            NSLayoutConstraint.activate([
                categoryContainerLeft.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                categoryContainerLeft.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.39),
                categoryContainerLeft.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.39),
                categoryContainerLeft.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                categoryContainerLeft.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40),
                
                emojiLeft.centerXAnchor.constraint(equalTo: categoryContainerLeft.centerXAnchor),
                emojiLeft.centerYAnchor.constraint(equalTo: categoryContainerLeft.centerYAnchor),
                
                titleLeft.centerXAnchor.constraint(equalTo: categoryContainerLeft.centerXAnchor),
                titleLeft.topAnchor.constraint(equalTo: emojiLeft.bottomAnchor),
                
                categoryContainerRight.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                categoryContainerRight.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.39),
                categoryContainerRight.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.39),
                categoryContainerRight.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
                categoryContainerRight.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40),
                
                emojiRight.centerXAnchor.constraint(equalTo: categoryContainerRight.centerXAnchor),
                emojiRight.centerYAnchor.constraint(equalTo: categoryContainerRight.centerYAnchor),
                
                titleRight.centerXAnchor.constraint(equalTo: categoryContainerRight.centerXAnchor),
                titleRight.topAnchor.constraint(equalTo: emojiRight.bottomAnchor)
            ])
            
            categoryContainerRight.isHidden = (titleRight.text ?? "").isEmpty
        }
        
        return container
    }
}

