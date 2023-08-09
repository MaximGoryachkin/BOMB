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
    let navBar = UINavigationBar(frame: .zero)
    
    lazy var rulesTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Правила Игры"
        label.textColor = UIColor(named: "purple")
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rulesHelpLabel: UILabel = {
        var label = UILabel(frame: .zero)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollView()
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
            categoriesHelpLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            categoriesHelpLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            categoriesHelpLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ])
    }
    
    @IBAction func didTapBack() {
        self.dismiss(animated: true)
    }
}
