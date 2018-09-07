//
//  IntermediaryModels.swift
//  RestaurantProject
//
//  Created by Abraham Quezada on 05/09/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey{
        case prepTime = "preparation_time"
    }
}
