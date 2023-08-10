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
    
    lazy var rulesTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Правила Игры"
        label.textColor = UIColor(named: "purple")
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rulesHelpLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = """
1 Все игроки становятся в круг.

2 Первый игрок берет телефон и нажимает кнопку:

3 На экране появляется вопрос. Например, «Назовите фрукт».

4 Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).

5 Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.

6 Проигравшим считается тот, в чьих руках взорвалась бомба.

7 Если в настройках выбран режим игры «С заданиями», то проигравший выполняет задание.
"""
        return label
    }()
    
    lazy var categoriesTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Категории"
        label.textColor = UIColor(named: "purple")
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var categoriesHelpLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = "В игре доступно 5 категорий по 15 вопросов.\n\n\nМожно выбрать сразу несколько категорий для игры."
        return label
    }()
    
    lazy var categoriesContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var category: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.backgroundColor = .white
              
        configureNavBar()
        setupScrollView()
    }
    
    func configureNavBar() {
        navigationItem.title = "Помощь"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.backBarButtonItem?.tintColor = .black
        
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        scrollView.addSubview(rulesTitleLabel)
        scrollView.addSubview(rulesHelpLabel)
        scrollView.addSubview(categoriesTitleLabel)
        scrollView.addSubview(categoriesHelpLabel)
        scrollView.addSubview(categoriesContainer)
        
        categoriesContainer.addSubview(category)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            rulesTitleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            rulesTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            
            rulesHelpLabel.topAnchor.constraint(equalTo: rulesTitleLabel.bottomAnchor, constant: 16),
            rulesHelpLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            rulesHelpLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            rulesHelpLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
            
            categoriesTitleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            categoriesTitleLabel.topAnchor.constraint(equalTo: rulesHelpLabel.bottomAnchor, constant: 16),
            
            categoriesHelpLabel.topAnchor.constraint(equalTo: categoriesTitleLabel.bottomAnchor, constant: 16),
//            categoriesHelpLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            categoriesHelpLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            categoriesHelpLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            categoriesContainer.topAnchor.constraint(equalTo: categoriesHelpLabel.bottomAnchor, constant: 16),
            categoriesContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            categoriesContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            categoriesContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
        
            category.topAnchor.constraint(equalTo: categoriesContainer.bottomAnchor, constant: 16),
            category.leadingAnchor.constraint(equalTo: categoriesContainer.leadingAnchor, constant: 16),
            category.trailingAnchor.constraint(equalTo: categoriesContainer.trailingAnchor, constant: -16),
            category.bottomAnchor.constraint(equalTo: categoriesContainer.bottomAnchor, constant: 16)
        
            
        ])
    }
}

