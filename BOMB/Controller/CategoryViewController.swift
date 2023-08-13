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
    var delegate: CheckCategoryProtocol!
    var buttons: [CustomButton] = []
    
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
        stackVerticalView.backgroundColor = .clear//free
        stackVerticalView.translatesAutoresizingMaskIntoConstraints = false
        return stackVerticalView
    } ()
    
    
    lazy var stackHorizViewOne: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .fill
        stackHorizontalView.alignment = .fill
        stackHorizontalView.spacing = 20
        stackHorizontalView.backgroundColor = .clear //free
        //stackHorizontalView.contentMode = .scaleToFill
        //stackHorizontalView.
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    lazy var stackHorizViewTwo: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .fill
        stackHorizontalView.alignment = .fill
        stackHorizontalView.spacing = 20
        stackHorizontalView.backgroundColor = .clear //free
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    lazy var stackHorizViewThree: UIStackView = {
        let stackHorizontalView = UIStackView()
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .fill
        stackHorizontalView.alignment = .fill
        stackHorizontalView.spacing = 20
        stackHorizontalView.backgroundColor = .clear //free
        
        //self.view.addSubview(stackHorizontalView)
        return stackHorizontalView
    } ()
    
    lazy var firstCategoriesBtn: CustomButton = {
        //тестовая картинка
        let categoriesOne = CustomButton(categoryImage: delegate.setInageForButton(category: .multfilm),
                                         frame: CGRect(x: 1, y: 1, width: 1, height: 1),
                                         isPressed: true,
                                         category: .multfilm)
        categoriesOne.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        //        categoriesOne.frame.size.width = widthBtn
        //        categoriesOne.frame.size.height = heightBtn
        categoriesOne.layer.cornerRadius = 10
        categoriesOne.layer.borderWidth = 3.0
        categoriesOne.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesOne.addTarget(self, action: #selector(categoriesOneAction), for: .touchUpInside)
        categoriesOne.translatesAutoresizingMaskIntoConstraints = false
        return categoriesOne
    }()
    
    lazy var secondCategoriesBtn: CustomButton = {
        let categoriesTwo = CustomButton(categoryImage: delegate.setInageForButton(category: .geography),
                                         frame: CGRect(x: 0, y: 0, width: 1, height: 1),
                                         isPressed: true,
                                         category: .geography)
        categoriesTwo.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        //        categoriesTwo.frame.size.width = widthBtn
        //        categoriesTwo.frame.size.height = heightBtn
        categoriesTwo.layer.cornerRadius = 10
        categoriesTwo.layer.borderWidth = 3.0
        categoriesTwo.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesTwo.addTarget(self, action: #selector(categoriesTwoAction), for: .touchUpInside)
        categoriesTwo.translatesAutoresizingMaskIntoConstraints = false
        return categoriesTwo
    }()
    
    lazy var thirdCategoriesBtn: CustomButton = {
        //width: 1, height: 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        let categoriesThree = CustomButton(categoryImage: delegate.setInageForButton(category: .science),
                                           frame: CGRect(x: 0, y: 0, width: 1, height: 1),
                                           isPressed: true,
                                           category: .science)
        categoriesThree.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesThree.frame.size.width = widthBtn
        categoriesThree.frame.size.height = heightBtn
        categoriesThree.layer.cornerRadius = 10
        categoriesThree.layer.borderWidth = 3.0
        categoriesThree.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesThree.addTarget(self, action: #selector(categoriesThreeAction), for: .touchUpInside)
        categoriesThree.translatesAutoresizingMaskIntoConstraints = false
        return categoriesThree
    }()
    
    lazy var fourthCategoriesBtn: CustomButton = {
        //width: 1, height: 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        let categoriesFour = CustomButton(categoryImage: delegate.setInageForButton(category: .videogame),
                                          frame: CGRect(x: 0, y: 0, width: 1, height: 1),
                                          isPressed: true,
                                          category: .videogame)
        categoriesFour.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesFour.frame.size.width = widthBtn
        categoriesFour.frame.size.height = heightBtn
        categoriesFour.layer.cornerRadius = 10
        categoriesFour.layer.borderWidth = 3.0
        categoriesFour.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesFour.addTarget(self, action: #selector(categoriesFourAction), for: .touchUpInside)
        categoriesFour.translatesAutoresizingMaskIntoConstraints = false
        return categoriesFour
    }()
    
    lazy var fifthCategoriesBtn: CustomButton = {
        let categoriesFive = CustomButton(categoryImage: delegate.setInageForButton(category: .other),
                                          frame: CGRect(x: 0, y: 0, width: 150, height: 150),
                                          isPressed: true,
                                          category: .other)
        categoriesFive.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesFive.frame.size.width = widthBtn
        categoriesFive.frame.size.height = heightBtn
        categoriesFive.layer.cornerRadius = 10
        categoriesFive.layer.borderWidth = 3.0
        categoriesFive.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesFive.addTarget(self, action: #selector(categoriesFiveAction), for: .touchUpInside)
        categoriesFive.translatesAutoresizingMaskIntoConstraints = false
        return categoriesFive
    }()
    //скрыта
    lazy var sixthCategoriesBtn: CustomButton = {
        let categoriesSix = CustomButton(categoryImage: "qest", frame: CGRect(x: 0, y: 0, width: 1, height: 1), isPressed: true,
                                         category: .geography)
        categoriesSix.backgroundColor = UIColor(red: 0x82, green: 0x15, blue: 0xC2)
        categoriesSix.frame.size.width = widthBtn
        categoriesSix.frame.size.height = heightBtn
        categoriesSix.layer.cornerRadius = 10
        categoriesSix.layer.borderWidth = 3.0
        categoriesSix.layer.borderColor = UIColor(red: 0x2A, green: 0x14, blue: 0x68).cgColor
        categoriesSix.addTarget(self, action: #selector(categoriesSixAction), for: .touchUpInside)
        categoriesSix.alpha = 0
        return categoriesSix
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews(views: background, stackVertView)
        addViewInStack(stack: stackVertView, views: stackHorizViewOne, stackHorizViewTwo, stackHorizViewThree)
        addViewInStack(stack: stackHorizViewOne, views: firstCategoriesBtn, secondCategoriesBtn)
        addViewInStack(stack: stackHorizViewTwo, views: thirdCategoriesBtn, fourthCategoriesBtn)
        addViewInStack(stack: stackHorizViewThree, views: fifthCategoriesBtn, sixthCategoriesBtn)
        addArrayButtons()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func addArrayButtons(){
        buttons.append(firstCategoriesBtn)
        buttons.append(secondCategoriesBtn)
        buttons.append(thirdCategoriesBtn)
        buttons.append(fourthCategoriesBtn)
        buttons.append(fifthCategoriesBtn)
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
            stackHorizViewOne.topAnchor.constraint(equalTo: stackVertView.topAnchor, constant: 10),
            stackHorizViewOne.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewOne.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            //stackHorizViewOne.heightAnchor.constraint(equalToConstant: 160)//delite
        ])
        NSLayoutConstraint.activate([
            stackHorizViewTwo.topAnchor.constraint(equalTo: stackHorizViewOne.bottomAnchor, constant: 20),
            stackHorizViewTwo.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewTwo.trailingAnchor.constraint(equalTo: stackVertView.trailingAnchor, constant: 0),
            stackHorizViewTwo.heightAnchor.constraint(equalTo: stackHorizViewOne.heightAnchor)
            
            //stackHorizViewTwo.heightAnchor.constraint(equalToConstant: 150)//delite
        ])
        NSLayoutConstraint.activate([
            stackHorizViewThree.topAnchor.constraint(equalTo: stackHorizViewTwo.bottomAnchor, constant: 20),
            stackHorizViewThree.leadingAnchor.constraint(equalTo: stackVertView.leadingAnchor, constant: 0),
            stackHorizViewThree.heightAnchor.constraint(equalTo: stackHorizViewTwo.heightAnchor)
        ])
        //stackHorizViewOne
        NSLayoutConstraint.activate([
            fifthCategoriesBtn.widthAnchor.constraint(equalTo: firstCategoriesBtn.heightAnchor),
            secondCategoriesBtn.widthAnchor.constraint(equalTo: secondCategoriesBtn.heightAnchor),
        ])
        
        //stackHorizViewTwo
        NSLayoutConstraint.activate([
            thirdCategoriesBtn.widthAnchor.constraint(equalTo: thirdCategoriesBtn.heightAnchor),
            fourthCategoriesBtn.widthAnchor.constraint(equalTo: fourthCategoriesBtn.heightAnchor),
        ])
        //stackHorizViewThree
        NSLayoutConstraint.activate([
            fifthCategoriesBtn.widthAnchor.constraint(equalTo: fifthCategoriesBtn.heightAnchor),
            sixthCategoriesBtn.widthAnchor.constraint(equalTo: sixthCategoriesBtn.heightAnchor),
        ])
        for button in buttons {
            button.setCheckMarkValue()
        }
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
    
//    func deleteCheckMark(sender: CustomButton){
//        for button in buttons {
//            if button.isPressed {
//                button.isPressed.toggle()
//                button.setChekMark()
//            }
//        }
//        sender.isPressed = !sender.isPressed
//        sender.setChekMark()
//    }
    
    @objc func categoriesOneAction() {
//        deleteCheckMark(sender: self.firstCategoriesBtn)
        delegate.updateModel(for: Category.multfilm.rawValue)
        firstCategoriesBtn.isPressed.toggle()
        firstCategoriesBtn.setChekMark()
    }
    
    @objc func categoriesTwoAction(){
//        deleteCheckMark(sender: self.secondCategoriesBtn)
        delegate.updateModel(for: Category.geography.rawValue)
        secondCategoriesBtn.isPressed.toggle()
        secondCategoriesBtn.setChekMark()
    }
    
    @objc func categoriesThreeAction(){
//        deleteCheckMark(sender: self.thirdCategoriesBtn)
        delegate.updateModel(for: Category.science.rawValue)
        thirdCategoriesBtn.isPressed.toggle()
        thirdCategoriesBtn.setChekMark()
    }
    
    @objc func categoriesFourAction(){
//        deleteCheckMark(sender: self.fourthCategoriesBtn)
        delegate.updateModel(for: Category.videogame.rawValue)
        fourthCategoriesBtn.isPressed.toggle()
        fourthCategoriesBtn.setChekMark()
    }
    
    @objc func categoriesFiveAction(){
//        deleteCheckMark(sender: self.fifthCategoriesBtn)
        delegate.updateModel(for: Category.other.rawValue)
        fifthCategoriesBtn.isPressed.toggle()
        fifthCategoriesBtn.setChekMark()
    }
    
    @objc func categoriesSixAction(){
        print("SixthCatigory")
    }
    
}

