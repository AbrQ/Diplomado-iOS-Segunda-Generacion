//
//  ActionButton.swift
//  WaterCounter
//
//  Created by Abraham Quezada on 10/13/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

@IBDesignable

class ActionButton: UIButton {
    
    private var halfWidth: CGFloat{
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat{
        return bounds.height / 2
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }
    

}
