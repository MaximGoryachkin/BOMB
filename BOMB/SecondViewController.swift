//
//  SecondViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    let button = UIButton()
    var delegate: CheckCategoryProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.backgroundColor = .red
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override func viewWillLayoutSubviews() {
        button.frame = view.bounds
    }
    
    @objc func buttonTapped() {
        delegate?.updateModel()
    }
    deinit {
        print("Bye")
    }
}
