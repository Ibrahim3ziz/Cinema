//
//  GradiantBackground.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 18/05/2022.
//

import UIKit

class GradientBackground: UIView {
    
// MARK: - View life cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension GradientBackground {
    private func gradientLayer() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let gradientLayer = CAGradientLayer()
        gradientLayer.borderColor = UIColor.green.cgColor
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemPurple.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        gradientLayer.shouldRasterize = true
        layer.addSublayer(gradientLayer)
    }
}
