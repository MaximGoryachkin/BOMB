//
//  RulesViewController.swift
//  BOMB
//
//  Created by Дарья Сотникова on 09.08.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    enum Constants {
        enum Fonts {
            static let title = UIFont.boldSystemFont(ofSize: 40)
            static let categoriesLabel = UIFont.systemFont(ofSize: 16)
            static let categoriesEmoji = UIFont.systemFont(ofSize: 60)
            static let helpText = UIFont.boldSystemFont(ofSize: 22)
        }
        
        enum CornerRadius {
            static let categoryContainer: CGFloat = 50
        }
        
        enum Colors {
            static let title = UIColor(named: "purple")
            static let categoryContainer = UIColor(named: "purple")
            static let scrollViewBackground = UIColor.white
            static let categoriesLabel = UIColor.white
            static let navBarBackground = UIColor.white
            static let navBarTint = UIColor.white
        }
        
        enum Insets {
            static let numberHeight: CGFloat = 70
            static let numberWidth: CGFloat = 70
            static let rulesText = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: -16)
            static let title = UIEdgeInsets(top: 20, left: 0, bottom: -8, right: 0)
            static let categoriesSizeMultipier: CGFloat = 0.39
            static let categoriesContainerLeft = UIEdgeInsets(top: 8, left: 40, bottom: 0, right: 0)
            static let categoriesContainerRight = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: -40)
            static let timeImage = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            static let timeDescriptionLabel = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
            static let categoriesDescriptionLabel = UIEdgeInsets(top: 12, left: 4, bottom: -12, right: -4)
        }
    }
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let model = RulesModel()
    
    func configureNavBar() {
        navigationItem.title = "Помощь"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.backgroundColor = Constants.Colors.navBarBackground
        navigationController?.navigationBar.barTintColor = Constants.Colors.navBarTint
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = Constants.Colors.scrollViewBackground
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        create(pagesFrom: [model.rulesPageRows, model.categoriesPageRows, model.settingsPageRows])
    }
    
    func create(pagesFrom pages: [[RulesCellViewModel]]) {
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
    
    func make(rowFor viewModel: RulesCellViewModel) -> UIView {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let categoryContainerLeft = UIView(frame: .zero)
        categoryContainerLeft.backgroundColor = Constants.Colors.categoryContainer ?? UIColor()
        categoryContainerLeft.translatesAutoresizingMaskIntoConstraints = false
        categoryContainerLeft.layer.cornerRadius = Constants.CornerRadius.categoryContainer
        
        let categoryContainerRight = UIView(frame: .zero)
        categoryContainerRight.backgroundColor = Constants.Colors.categoryContainer ?? UIColor()
        categoryContainerRight.translatesAutoresizingMaskIntoConstraints = false
        categoryContainerRight.layer.cornerRadius = Constants.CornerRadius.categoryContainer
        
        switch viewModel {
        case let .imageAndText(image, text):
            let label = UILabel(frame: .zero)
            label.text = text
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = Constants.Fonts.helpText
            label.textAlignment = .center
            
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            
            container.addSubview(label)
            container.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: container.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: Constants.Insets.numberHeight),
                imageView.widthAnchor.constraint(equalToConstant: Constants.Insets.numberHeight),
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.Insets.rulesText.top),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: Constants.Insets.rulesText.bottom),
                label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.Insets.rulesText.right),
            ])
            
            guard let image else { break }
            imageView.image = image
            
        case .title(let text):
            let label = UILabel(frame: .zero)
            label.text = text
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = Constants.Fonts.title
            label.textAlignment = .center
            label.numberOfLines = 0
            label.textColor = Constants.Colors.title
            container.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.Insets.title.top),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: Constants.Insets.title.bottom),
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
                imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])
            
        case .twoImagesLabel(left: let left, right: let right):
            let titleLeft = UILabel(frame: .zero)
            let titleRight = UILabel(frame: .zero)
            titleLeft.text = left?.0
            titleRight.text = right?.0
            titleLeft.textColor = Constants.Colors.categoriesLabel
            titleRight.textColor = Constants.Colors.categoriesLabel
            titleLeft.font = Constants.Fonts.categoriesLabel
            titleRight.font = Constants.Fonts.categoriesLabel
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
            emojiLeft.font = Constants.Fonts.categoriesEmoji
            emojiRight.font = Constants.Fonts.categoriesEmoji
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
                categoryContainerLeft.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: Constants.Insets.categoriesSizeMultipier),
                categoryContainerLeft.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: Constants.Insets.categoriesSizeMultipier),
                categoryContainerLeft.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.Insets.categoriesContainerLeft.top),
                categoryContainerLeft.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.Insets.categoriesContainerLeft.left),
                
                emojiLeft.centerXAnchor.constraint(equalTo: categoryContainerLeft.centerXAnchor),
                emojiLeft.centerYAnchor.constraint(equalTo: categoryContainerLeft.centerYAnchor),
                
                titleLeft.centerXAnchor.constraint(equalTo: categoryContainerLeft.centerXAnchor),
                titleLeft.topAnchor.constraint(equalTo: emojiLeft.bottomAnchor),
                
                categoryContainerRight.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                categoryContainerRight.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: Constants.Insets.categoriesSizeMultipier),
                categoryContainerRight.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: Constants.Insets.categoriesSizeMultipier),
                categoryContainerRight.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.Insets.categoriesContainerRight.top),
                categoryContainerRight.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.Insets.categoriesContainerRight.right),
                
                emojiRight.centerXAnchor.constraint(equalTo: categoryContainerRight.centerXAnchor),
                emojiRight.centerYAnchor.constraint(equalTo: categoryContainerRight.centerYAnchor),
                
                titleRight.centerXAnchor.constraint(equalTo: categoryContainerRight.centerXAnchor),
                titleRight.topAnchor.constraint(equalTo: emojiRight.bottomAnchor)
            ])
            
            categoryContainerRight.isHidden = (titleRight.text ?? "").isEmpty
            
        case .timeDurationLabel(let image, let text):
            let durationImage = UIImageView(frame: .zero)
            durationImage.translatesAutoresizingMaskIntoConstraints = false
            durationImage.image = image
            durationImage.contentMode = .scaleAspectFill
            durationImage.setContentHuggingPriority(.defaultLow, for: .horizontal)
            
            let descriptionLabel = UILabel(frame: .zero)
            descriptionLabel.text = text
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = Constants.Fonts.helpText
            descriptionLabel.textAlignment = .center
            descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            
            container.addSubview(durationImage)
            container.addSubview(descriptionLabel)
            
            NSLayoutConstraint.activate([
                durationImage.topAnchor.constraint(equalTo: container.topAnchor),
                durationImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.Insets.timeImage.left),
                durationImage.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                
                descriptionLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                descriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.Insets.timeDescriptionLabel.right),
                descriptionLabel.leadingAnchor.constraint(equalTo: durationImage.trailingAnchor, constant: Constants.Insets.timeDescriptionLabel.left)
            ])
            
        case .text(let text):
            let label = UILabel(frame: .zero)
            label.text = text
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = Constants.Fonts.helpText
            label.textAlignment = .center
            label.numberOfLines = 0
            container.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.Insets.categoriesDescriptionLabel.top),
                label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: Constants.Insets.categoriesDescriptionLabel.bottom),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.Insets.categoriesDescriptionLabel.left),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Constants.Insets.categoriesDescriptionLabel.right),
            ])
        }
        
        return container
    }
}

