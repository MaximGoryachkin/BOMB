//
//  GameViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 09.08.2023.
//

import UIKit

class GameViewController: UINavigationController {
    
    var model: QuestionModel?
    let button = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle(model?.setQuestion(), for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.backgroundColor = .cyan
        view.addSubview(button)
        button.addTarget(self, action: #selector(updateQuestion), for: .touchUpInside)
    }

    override func viewWillLayoutSubviews() {
        button.frame = view.bounds
    }
    
    @objc func updateQuestion() {
//        if lastQuestion.count != model?.counter {
//            guard let question = model?.setQuestion() else { return }
//            if !lastQuestion.contains(question) {
//                lastQuestion.append(question)
//                button.setTitle(question, for: .normal)
//                return
//            } else {
//                updateQuestion()
//            }
//        } else {
//            button.setTitle("Questions end", for: .normal)
//        }
        button.setTitle(model?.setQuestion(), for: .normal)
        
        
    }
    
    deinit {
        print("Bye")
    }
    
}
