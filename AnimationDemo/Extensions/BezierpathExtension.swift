//
//  BezierpathExtension.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/13/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}

extension UIBezierPath {
    
    convenience init(heartIn rect: CGRect) {
        self.init()
        
        //Calculate Radius of Arcs using Pythagoras
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        
        //Left Hand Curve
        let leftCurveCenter = CGPoint(x: (rect.width * 0.3) - rect.width / 2, y: (rect.height * 0.35) - rect.height / 2)
        addArc(withCenter: leftCurveCenter, radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        //Top Centre Dip
        let topCentreDipPoint = CGPoint(x: 0, y: (rect.height * 0.2) - rect.height / 2)
        addLine(to: topCentreDipPoint)
        
        //Right Hand Curve
        let rightCurveCenter = CGPoint(x: (rect.width * 0.7) - rect.width / 2, y: (rect.height * 0.35) - rect.height / 2)
        addArc(withCenter: rightCurveCenter, radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        
        //Right Bottom Line
        let rightBottomLinePoint = CGPoint(x: (rect.width * 0.5) - rect.width / 2, y: (rect.height * 0.95) - rect.height / 2)
        addLine(to: rightBottomLinePoint)
        
        //Left Bottom Line
        close()
    }
    
    convenience init(triangle rect: CGRect) {
        self.init()
        move(to: .zero)
        addLine(to: CGPoint(x: 50, y: 50))
        addLine(to: CGPoint(x: 50, y: 150))
        addLine(to: CGPoint(x: 150, y: 50))
        addLine(to: .zero)
    }
}
