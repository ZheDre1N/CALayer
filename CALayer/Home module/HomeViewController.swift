//
//  HomeViewController.swift
//  CALayer
//
//  Created by Eugene Dudkin on 21.02.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = UIColor.lightGray.cgColor
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .square
            overShapeLayer.strokeEnd = 0
            overShapeLayer.strokeColor = UIColor.systemGreen.cgColor
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.colors = [
                UIColor.red.cgColor,
                UIColor.blue.cgColor,
                UIColor.black.cgColor
            ]
            gradientLayer.locations = [0.2, 0.6, 1]
            
        }
    }
    
    @IBOutlet weak var imageView: UIView! {
        didSet {
            imageView.layer.cornerRadius = 60
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.black.cgColor
            imageView.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.titleLabel?.textColor = .white
            button.layer.backgroundColor = UIColor.systemGreen.cgColor
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowRadius = 10
            button.layer.shadowOpacity = 1
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    private func configShapeLayer(_ shapelayer: CAShapeLayer) {
        shapelayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2 + 100))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 + 100))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))

        shapelayer.path = path.cgPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        
        let loadingShape = CABasicAnimation(keyPath: "strokeEnd")
        loadingShape.toValue = 1
        loadingShape.duration = 5
        loadingShape.timingFunction = CAMediaTimingFunction(name: .easeIn)
        loadingShape.fillMode = .both
        loadingShape.isRemovedOnCompletion = false
        loadingShape.delegate = self
        overShapeLayer.add(loadingShape, forKey: loadingShape.keyPath)
        
        
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        overShapeLayer.strokeEnd += 0.2
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension HomeViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("finish")
    }
}
