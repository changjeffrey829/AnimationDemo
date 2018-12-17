//
//  HeartView.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/11/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import UIKit

class HeartView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
//        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let pulsatingLayer = createHeartShapeLayer(frame: frame, strokeColor: .blue, fillColor: .clear)
//        pulsatingLayer.anchorPoint = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        layer.addSublayer(pulsatingLayer)
        animatePulsatingLayer(layer: pulsatingLayer)
        
    }
    
    fileprivate func animatePulsatingLayer(layer: CAShapeLayer) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.5
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        print("where's the anchor point: \(layer.anchorPoint)")
        layer.add(animation, forKey: "pulsing")
    }
    
    fileprivate func createHeartShapeLayer(frame: CGRect, strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let hearthPath = UIBezierPath(heartIn: frame)
        layer.path = hearthPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        return layer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
