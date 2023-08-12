//
//  CategoryViewController.swift
//  BOMB
//
//  Created by Dmitriy Eliseev on 11.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    let heightBtn: CGFloat = 200
    let widthBtn: CGFloat = 200
    let btnsHeightText: CGFloat = 25
    
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
    
    lazy var firstCategoriesBtn: CustomButton = {
        //тестовая картинка
        let categoriesOne = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: false)
        categoriesOne.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesOne.frame.size.width = widthBtn
        categoriesOne.frame.size.height = heightBtn
        //не работает даже без скругления
        //categoriesOne.layer.cornerRadius = 10
        categoriesOne.layer.borderWidth = 3.0
        categoriesOne.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesOne.addTarget(self, action: #selector(categoriesOneAction), for: .touchUpInside)
        return categoriesOne
    }()
    
    lazy var secondCategoriesBtn: CustomButton = {
        let categoriesTwo = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: false)
        categoriesTwo.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesTwo.frame.size.width = widthBtn
        categoriesTwo.frame.size.height = heightBtn
        categoriesTwo.layer.cornerRadius = 10
        categoriesTwo.layer.borderWidth = 3.0
        categoriesTwo.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesTwo.addTarget(self, action: #selector(categoriesTwoAction), for: .touchUpInside)
        return categoriesTwo
    }()
    
    lazy var thirdCategoriesBtn: CustomButton = {
        let categoriesThree = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: false)
        categoriesThree.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesThree.frame.size.width = widthBtn
        categoriesThree.frame.size.height = heightBtn
        categoriesThree.layer.cornerRadius = 10
        categoriesThree.layer.borderWidth = 3.0
        categoriesThree.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesThree.addTarget(self, action: #selector(categoriesThreeAction), for: .touchUpInside)
        return categoriesThree
    }()
    
    lazy var fourthCategoriesBtn: CustomButton = {
        let categoriesFour = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: false)
        categoriesFour.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesFour.frame.size.width = widthBtn
        categoriesFour.frame.size.height = heightBtn
        categoriesFour.layer.cornerRadius = 10
        categoriesFour.layer.borderWidth = 3.0
        categoriesFour.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesFour.addTarget(self, action: #selector(categoriesFourAction), for: .touchUpInside)
        return categoriesFour
    }()
    
    lazy var fifthCategoriesBtn: CustomButton = {
        let categoriesFive = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: false)
        categoriesFive.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesFive.frame.size.width = widthBtn
        categoriesFive.frame.size.height = heightBtn
        categoriesFive.layer.cornerRadius = 10
        categoriesFive.layer.borderWidth = 3.0
        categoriesFive.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesFive.addTarget(self, action: #selector(categoriesFiveAction), for: .touchUpInside)
        return categoriesFive
    }()
    lazy var sixthCategoriesBtn: CustomButton = {
        let categoriesSix = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: false)
        categoriesSix.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesSix.frame.size.width = widthBtn
        categoriesSix.frame.size.height = heightBtn
        categoriesSix.layer.cornerRadius = 10
        categoriesSix.layer.borderWidth = 3.0
        categoriesSix.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesSix.addTarget(self, action: #selector(categoriesSixAction), for: .touchUpInside)
        return categoriesSix
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews(views: background, stackVertView)
        addViewInStack(stack: stackVertView, views: stackHorizViewOne, stackHorizViewTwo, stackHorizViewThree)
        addViewInStack(stack: stackHorizViewOne, views: firstCategoriesBtn, secondCategoriesBtn)
        addViewInStack(stack: stackHorizViewTwo, views: thirdCategoriesBtn, fourthCategoriesBtn)
        addViewInStack(stack: stackHorizViewThree, views: fifthCategoriesBtn, sixthCategoriesBtn)
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate([
            stackVertView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackVertView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackVertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            //stackVertView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            stackHorizViewOne.topAnchor.constraint(equalTo: stackVertView.topAnchor, constant: 0),
            stackHorizViewOne.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewOne.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewOne.heightAnchor.constraint(equalToConstant: 150)//delite
        ])
        NSLayoutConstraint.activate([
            stackHorizViewTwo.topAnchor.constraint(equalTo: stackHorizViewOne.bottomAnchor, constant: 0),
            stackHorizViewTwo.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewTwo.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewTwo.heightAnchor.constraint(equalTo: stackHorizViewOne.heightAnchor)
            
            //stackHorizViewTwo.heightAnchor.constraint(equalToConstant: 150)//delite
        ])
        NSLayoutConstraint.activate([
            stackHorizViewThree.topAnchor.constraint(equalTo: stackHorizViewTwo.bottomAnchor, constant: 0),
            stackHorizViewThree.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            //stackHorizViewThree.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewThree.heightAnchor.constraint(equalTo: stackHorizViewTwo.heightAnchor)
            //stackHorizViewThree.heightAnchor.constraint(equalToConstant: 150)//delite
        ])
        //stackHorizViewOne
        NSLayoutConstraint.activate([
            firstCategoriesBtn.topAnchor.constraint(equalTo: stackHorizViewOne.topAnchor, constant: 10),
            firstCategoriesBtn.bottomAnchor.constraint(equalTo: stackHorizViewOne.bottomAnchor, constant: -10),
            firstCategoriesBtn.widthAnchor.constraint(equalTo: firstCategoriesBtn.heightAnchor),
            secondCategoriesBtn.topAnchor.constraint(equalTo: stackHorizViewOne.topAnchor, constant: 10),
            secondCategoriesBtn.bottomAnchor.constraint(equalTo: stackHorizViewOne.bottomAnchor, constant: -10),
            secondCategoriesBtn.widthAnchor.constraint(equalTo: secondCategoriesBtn.heightAnchor)
        ])
        //stackHorizViewTwo
        NSLayoutConstraint.activate([
            thirdCategoriesBtn.topAnchor.constraint(equalTo: stackHorizViewTwo.topAnchor, constant: 10),
            thirdCategoriesBtn.bottomAnchor.constraint(equalTo: stackHorizViewTwo.bottomAnchor, constant: -10),
            thirdCategoriesBtn.widthAnchor.constraint(equalTo: thirdCategoriesBtn.heightAnchor),
            fourthCategoriesBtn.topAnchor.constraint(equalTo: stackHorizViewTwo.topAnchor, constant: 10),
            fourthCategoriesBtn.bottomAnchor.constraint(equalTo: stackHorizViewTwo.bottomAnchor, constant: -10),
            fourthCategoriesBtn.widthAnchor.constraint(equalTo: fourthCategoriesBtn.heightAnchor)
        ])
        //stackHorizViewThree
        NSLayoutConstraint.activate([
            fifthCategoriesBtn.topAnchor.constraint(equalTo: stackHorizViewThree.topAnchor, constant: 10),
            fifthCategoriesBtn.bottomAnchor.constraint(equalTo: stackHorizViewThree.bottomAnchor, constant: -10),
            fifthCategoriesBtn.widthAnchor.constraint(equalTo: fifthCategoriesBtn.heightAnchor),
            sixthCategoriesBtn.topAnchor.constraint(equalTo: stackHorizViewThree.topAnchor, constant: 10),
            sixthCategoriesBtn.bottomAnchor.constraint(equalTo: stackHorizViewThree.bottomAnchor, constant: -10),
            sixthCategoriesBtn.widthAnchor.constraint(equalTo: sixthCategoriesBtn.heightAnchor)

        ])
    }
    

    
    
    
    func addViews(views: UIView...){
        for view in views {
            self.view.addSubview(view)
        }
    }
    
    func addViewInStack(stack: UIStackView, views: UIView...){
        for view in views {
            stack.addArrangedSubview(view)
        }
    }
    
    @objc func categoriesOneAction(){
        print("firstCatigory")
    }
    
    @objc func categoriesTwoAction(){
        print("SecondCatigory")
    }
    
    @objc func categoriesThreeAction(){
        print("ThirdCatigory")
    }
    
    @objc func categoriesFourAction(){
        print("FourthCatigory")
    }
    
    @objc func categoriesFiveAction(){
        print("FifthCatigory")
    }
    
    @objc func categoriesSixAction(){
        print("SixthCatigory")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
