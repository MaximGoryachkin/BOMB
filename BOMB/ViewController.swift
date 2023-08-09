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
    var counter = 0
    
    private lazy var first: UIButton = {
        let view = UIButton(type: .system)
        view.frame = self.view.bounds
        view.setTitle("start", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    var model = QuestionModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(first)
        
        navigationItem.backButtonTitle = ""
        first.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override func viewWillLayoutSubviews() {
        
    }
    
    @objc func buttonTapped() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        present(secondVC, animated: true)
        print("Now counter is \(counter)")
    }

}

extension ViewController: CheckCategoryProtocol {
    
    func updateModel() {
        counter += 1
        print("Change counter to \(counter)")
    }
}
