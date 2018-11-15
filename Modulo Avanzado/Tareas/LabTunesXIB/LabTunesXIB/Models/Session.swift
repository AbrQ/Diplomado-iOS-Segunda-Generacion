//
//  Session.swift
//  LabTunesXIB
//
//  Created by Abraham Quezada on 11/13/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation

class Session: NSObject{
    var token: String?
    static let sharedInstance = Session()
    
    override private init(){
        super.init()
    }
    
    func saveSession(){
        token = "1234567890"
    }
}
