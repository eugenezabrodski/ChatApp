//
//  GradientView.swift
//  ChatApp
//
//  Created by Eugene on 29/02/2024.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColor(start: startColor, end: endColor)
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColor(start: startColor, end: endColor)
        }
    }
    private let gradientLayer = CAGradientLayer()
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing
        
        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    init(from: Point, to: Point, start: UIColor?, end: UIColor?) {
        self.init()
        setupGradient(from: from, to: to, start: start, end: end)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient(from: .leading, to: .trailing, start: startColor, end: endColor)
    }
    
    private func setupGradient(from: Point, to: Point, start: UIColor?, end: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        setupGradientColor(start: start, end: end)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
    }
    
    private func setupGradientColor(start: UIColor?, end: UIColor?) {
        if let start = start, let end = end {
            gradientLayer.colors = [start.cgColor, end.cgColor]
        }
    }
    
}
