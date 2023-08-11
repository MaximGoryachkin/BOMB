//
//  NavigationController.swift
//  BOMB
//
//  Created by Максим Горячкин on 10.08.2023.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNavigationControllerAppearance()
    }
    
    private func loadNavigationControllerAppearance() {
        let standartAppearance = UINavigationBarAppearance()
        standartAppearance.configureWithOpaqueBackground()
        standartAppearance.backgroundColor = UIColor(named: "purple")
        standartAppearance.setBackIndicatorImage(UIImage(systemName: "backward.end.fill"),
                                                 transitionMaskImage: UIImage(systemName: "backward.end.fill"))
        standartAppearance.titleTextAttributes = [.font: UIFont(name: "Georgia-Bold", size: 18)!,
                                                  .foregroundColor: UIColor.white
        ]
        
        let compactAppearance = standartAppearance.copy()
        
        navigationBar.compactAppearance = compactAppearance
        navigationBar.standardAppearance = standartAppearance
        navigationBar.scrollEdgeAppearance = compactAppearance
        if #available(iOS 15.0, *) {
            navigationBar.compactScrollEdgeAppearance = compactAppearance
        }
        
        
    }
}
