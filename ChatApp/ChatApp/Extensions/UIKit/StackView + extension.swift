//
//  StackView + extension.swift
//  ChatApp
//
//  Created by Eugene on 24/02/2024.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubViews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spacing
    }
    
}
