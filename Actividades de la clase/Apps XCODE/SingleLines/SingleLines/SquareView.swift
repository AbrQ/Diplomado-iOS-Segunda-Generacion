//
//  SquareView.swift
//  SingleLines
//
//  Created by Abraham Quezada on 10/13/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class SquareView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let aPath = UIBezierPath()
        aPath.lineWidth = 6
        aPath.move(to: CGPoint(x: 10, y: 0))
        aPath.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        aPath.addQuadCurve(to: CGPoint(x: frame.width, y: 10), controlPoint: CGPoint(x: frame.width, y: 0))
        UIColor.black.set()
        
        aPath.stroke()
//        let context = UIGraphicsGetCurrentContext()
//        context?.setStrokeColor(UIColor.black.cgColor)
//        context?.setLineWidth(2)
//        context?.move(to: CGPoint(x: 10, y: 0))
//        context?.addLine(to: CGPoint(x: frame.width - 10, y: 0))
//        context?.addQuadCurve(to: CGPoint(x: frame.width, y: 10), control: CGPoint(x: frame.width, y: 10))
//        context?.addLine(to: CGPoint(x: 160, y: 160))
//        context?.addQuadCurve(to: CGPoint(x: 150, y: 170), control: CGPoint(x: 160, y: 170))
//        context?.addLine(to: CGPoint(x: 50, y: 170))
//        context?.addQuadCurve(to: CGPoint(x: 40, y: 160), control: CGPoint(x: 40, y: 170))
//        context?.addLine(to: CGPoint(x: 40, y: 70))
//        context?.addQuadCurve(to: CGPoint(x: 50, y: 50), control: CGPoint(x: 40, y: 50))
//
//        context?.strokePath()
    }
    

}
