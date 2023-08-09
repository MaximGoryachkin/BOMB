//
//  SecondViewController.swift
//  BOMB
//
//  Created by Максим Горячкин on 07.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let button = UIButton()
    var delegate: CheckCategoryProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle(Category.science.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.backgroundColor = .red
        view.addSubview(button)
        button.addTarget(self, action: #selector(changeCategory(_:)), for: .touchUpInside)
    }

    override func viewWillLayoutSubviews() {
        button.frame = view.bounds
    }
    
    @objc func changeCategory(_ sender: UIButton) {
        guard let name = sender.titleLabel?.text else { return }
        delegate?.updateModel(for: name)
    }
    
    deinit {
        print("Bye")
    }
}
