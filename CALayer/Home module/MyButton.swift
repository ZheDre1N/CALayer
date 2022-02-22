//
//  MyButton.swift
//  CALayer
//
//  Created by Eugene Dudkin on 22.02.2022.
//

import UIKit

@IBDesignable
class MyButton: UIButton {

    private var cornerRadii = CGSize()
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        }
    }
    
    @IBInspectable var color: UIColor = .systemGreen
    var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: cornerRadii)
        color.setFill()
        path?.fill()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let path = path {
            return path.contains(point)
        }
        
        return false
    }

}
