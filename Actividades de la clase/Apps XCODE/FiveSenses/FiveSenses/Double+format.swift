//
//  Double+format.swift
//  FiveSenses
//
//  Created by Abraham Quezada on 10/19/18.
//  Copyright © 2018 fi.unam.mx. All rights reserved.
//

import Foundation

extension Double{
    func format() -> String {
        let trim = Float(self * 1000.0) / 1000.0
        return "\(trim)"
    }
}
