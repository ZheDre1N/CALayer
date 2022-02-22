//
//  MaskViewController.swift
//  CALayer
//
//  Created by Eugene Dudkin on 22.02.2022.
//

import UIKit

class MaskViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    
    var replicatorLayer: CAReplicatorLayer!
    var sourceLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CALayer()
        
        
        self.view.layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(sourceLayer)
        
        startAnimation(delay: 0.05, replicates: 45)
        
    }

    
    override func viewWillLayoutSubviews() {
        replicatorLayer.frame = self.view.bounds
        replicatorLayer.position = self.view.center
        sourceLayer.frame = CGRect(x: 0, y: 0, width: 3, height: 17)
        sourceLayer.backgroundColor = UIColor.white.cgColor
        sourceLayer.position = self.view.center
        sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    
    private func startAnimation(delay: TimeInterval, replicates: Int) {
        replicatorLayer.instanceCount = replicates
        let angle = CGFloat(2.0 * Double.pi) / CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
        replicatorLayer.instanceDelay = delay
        
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = Double(replicates) * delay
        opacityAnimation.repeatCount = Float.infinity
        
        sourceLayer.add(opacityAnimation, forKey: "opacity")

        
    }
    
}
