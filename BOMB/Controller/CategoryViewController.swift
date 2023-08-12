//
//  CategoryViewController.swift
//  BOMB
//
//  Created by Dmitriy Eliseev on 11.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var delegate: CheckCategoryProtocol!
    
    lazy var background: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.frame.size.width = view.frame.width
        backgroundImageView.frame.size.height = view.frame.height
        let background = UIImage(named: "background")
        backgroundImageView.image = background
        //self.view.addSubview(backgroundImageView)
        return backgroundImageView
    }()
    
    lazy var stackVertView: UIStackView = {
        let stackVerticalView = UIStackView()
        stackVerticalView.axis = .vertical
        stackVerticalView.distribution = .equalCentering
        stackVerticalView.alignment = .center
        stackVerticalView.spacing = 10
        stackVerticalView.backgroundColor = .green//free
        stackVerticalView.translatesAutoresizingMaskIntoConstraints = false
        return stackVerticalView
    } ()
    
    lazy var stackHorizViewOne: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        stackHorizontalView.alignment = .center
        stackHorizontalView.spacing = 50
        stackHorizontalView.backgroundColor = .red //free
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    
    lazy var stackHorizViewTwo: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        stackHorizontalView.alignment = .center
        stackHorizontalView.spacing = 50
        stackHorizontalView.backgroundColor = .green //free
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    
    lazy var stackHorizViewThree: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        stackHorizontalView.alignment = .center
        stackHorizontalView.spacing = 50
        stackHorizontalView.backgroundColor = .blue //free
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews(views: background, stackVertView)
        addViewInStack(stack: stackVertView, views: stackHorizViewOne, stackHorizViewTwo, stackHorizViewThree)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate([
            stackVertView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackVertView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackVertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            //stackVertView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            stackHorizViewOne.topAnchor.constraint(equalTo: stackVertView.topAnchor, constant: 0),
            stackHorizViewOne.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewOne.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewOne.heightAnchor.constraint(equalToConstant: 200)//delite
        ])
        NSLayoutConstraint.activate([
            stackHorizViewTwo.topAnchor.constraint(equalTo: stackHorizViewOne.bottomAnchor, constant: 0),
            stackHorizViewTwo.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewTwo.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewTwo.heightAnchor.constraint(equalToConstant: 200)//delite
        ])
        NSLayoutConstraint.activate([
            stackHorizViewThree.topAnchor.constraint(equalTo: stackHorizViewTwo.bottomAnchor, constant: 0),
            stackHorizViewThree.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewThree.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewThree.heightAnchor.constraint(equalToConstant: 200)//delite
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func addViews(views: UIView...) {
        for view in views {
            self.view.addSubview(view)
        }
    }
    
    func addViewInStack(stack: UIStackView, views: UIView...) {
        for view in views {
            stack.addArrangedSubview(view)
        }
    }

}
