//
//  UIView + extension.swift
//  ChatApp
//
//  Created by Eugene on 04/03/2024.
//

import UIKit

extension UIView {
    
    func applyGradients(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, start: #colorLiteral(red: 0.2571451366, green: 0.8727994561, blue: 0.8521080613, alpha: 1), end: #colorLiteral(red: 0.930799067, green: 0.3020974696, blue: 0.1494907439, alpha: 1))
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        //self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
