//
//  myView.swift
//  CALayer
//
//  Created by Eugene Dudkin on 22.02.2022.
//

import UIKit

@IBDesignable
class MyView: UIView {
    private var size = CGSize()
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet {
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: size).cgPath
        self.layer.mask = shapeLayer
        self.layer.backgroundColor = UIColor.green.cgColor
        
    }
}
