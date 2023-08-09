//
//  ViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit

protocol CheckCategoryProtocol: AnyObject {
    func updateModel()
}

class ViewController: UIViewController {
    
    private lazy var first: UIButton = {
        let view = UIButton(type: .system)
        view.frame = self.view.bounds
        view.setTitle(Category.multfilm.rawValue, for: .normal)
        view.setTitleColor(model.multfilmCategorie.isChoose ? .green : .red, for: .normal)
        return view
    }()
    
    var model = QuestionModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(first)
        
        navigationItem.backButtonTitle = ""
        first.addTarget(self, action: #selector(doSome(_: )), for: .touchUpInside)
    }

    override func viewWillLayoutSubviews() {
        
    }
    
    @objc func buttonTapped() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        present(secondVC, animated: true)
    }
    
    @objc func doSome(_ sender: UIButton) {
        guard let name = sender.titleLabel?.text else { return }
        
        switch name {
        case Category.multfilm.rawValue:
            model.update(categoryName: .multfilm)
        case Category.geography.rawValue:
            model.update(categoryName: .geography)
            first.setTitleColor(model.multfilmCategorie.isChoose ? .green : .red, for: .normal)
        case Category.science.rawValue:
            model.update(categoryName: .science)
        default:
            print("Not match")
        }
    }

}

extension ViewController: CheckCategoryProtocol {
    
    func updateModel() {

    }
}
