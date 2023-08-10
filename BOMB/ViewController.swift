//
//  ViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit


class ViewController: UIViewController {
    
    var model = QuestionModel()
    
    private lazy var first: UIButton = {
        let view = UIButton(type: .system)
        view.frame = self.view.bounds
        view.setTitle("Choose Your Category", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(first)
        
        navigationItem.backButtonTitle = ""
        first.addTarget(self, action: #selector(gameButtonPressed), for: .touchUpInside)
    }
    
    @objc func categoryButtonPressed() {
        let categoryVC = CategoryViewController()
        categoryVC.delegate = self
        present(categoryVC, animated: true)
    }
    
    @objc func gameButtonPressed() {
        let gameVC = GameViewController()
        self.model.addQuestions()
        gameVC.model = self.model
        present(gameVC, animated: true)
        print(model.multfilmCategorie.isChoose, model.geographyCategorie.isChoose, model.scienceCategorie.isChoose)
    }

}

extension ViewController: CheckCategoryProtocol {
    
    func updateModel(for name: String) {
        model.update(categoryName: name)
    }
    
}
