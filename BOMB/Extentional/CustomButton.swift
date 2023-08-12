//
//  CustomButton.swift
//  TestAPP
//
//  Created by Максим Горячкин on 11.08.2023.
//

import UIKit

class CustomButton: UIButton {
    
    lazy var checkMarkImage: UIImageView = {
        let checkMark = UIImageView()
        return checkMark
    }()
    
    var isPressed: Bool
    
    init(categoryImage: String, frame: CGRect, isPressed: Bool) {
        self.isPressed = isPressed
        super.init(frame: frame)
        self.addSubview(checkMarkImage)
        self.setImage(UIImage(named: categoryImage), for: .normal)
        checkMarkImage.frame.size.width = self.frame.width/6
        checkMarkImage.frame.size.height = self.frame.height/6
        checkMarkImage.frame.origin.x = 10
        checkMarkImage.frame.origin.y = 10
        setChekMark()
    }
 
    func setChekMark(){
        if isPressed {
            self.checkMarkImage.image = UIImage(systemName: "checkmark.square")
        } else {
            self.checkMarkImage.image = UIImage(systemName: "square")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchIn(){
        isPressed = !isPressed
        self.setChekMark()
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
