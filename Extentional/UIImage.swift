//
//  UIImage.swift
//  BOMB
//
//  Created by Dmitriy Eliseev on 11.08.2023.
//

import UIKit

extension UIImage {
    static func gImage(frame: CGRect, colors:[UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        let render = UIGraphicsImageRenderer(bounds: frame)
        return render.image{ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
