//
//  CustomButton.swift
//  TestAPP
//
//  Created by Максим Горячкин on 11.08.2023.
//

import UIKit

class CustomButton: UIButton {
    
    lazy var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    lazy var checkMarkImage: UIImageView = {
        let checkMark = UIImageView()
        return checkMark
    }()
    
    var isPressed: Bool
    
    init(categoryImage: String, frame: CGRect, isPressed: Bool) {
        self.isPressed = isPressed
        super.init(frame: frame)
        
        self.addSubview(customImageView)
        self.addSubview(checkMarkImage)
        
        customImageView.frame = self.bounds
        customImageView.image = UIImage(systemName: categoryImage)
        checkMarkImage.frame.origin = self.bounds.origin
        checkMarkImage.frame.size = CGSize(width: self.bounds.width / 5, height: self.bounds.width / 5)
        
        if isPressed {
            checkMarkImage.image = UIImage(systemName: "checkmark.square")
        } else {
            checkMarkImage.image = UIImage(systemName: "square")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchIn(){
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: [.allowUserInteraction, .curveEaseIn],
                       animations: {
            self.transform = .init(scaleX: 0.95, y: 0.95)
        },
                       completion: nil)
    }
    
    func touchEnd(){
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: [.allowUserInteraction, .curveEaseOut],
                       animations: {
            self.transform = .identity
        },
                       completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchIn()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEnd()
    }
}
