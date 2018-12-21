//
//  HeartView.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/11/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import UIKit

class HeartView: UIView {
    var pulsatingLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pulsatingLayer = createHeartShapeLayer(frame: frame, strokeColor: .red, fillColor: .red)
        pulsatingLayer.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        layer.addSublayer(pulsatingLayer)
        animatePulsatingLayer()
//        animatePulsatingLayer(layer: pulsatingLayer)
        
    }
    
    func animatePulsatingLayer() {
        let animation = PulsatingAnimation()
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
    
    fileprivate func PulsatingAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.5
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
//        layer.add(animation, forKey: "pulsing")
        return animation
    }
    
    fileprivate func createHeartShapeLayer(frame: CGRect, strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let hearthPath = UIBezierPath(heartIn: frame)
        layer.path = hearthPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 10
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        return layer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
