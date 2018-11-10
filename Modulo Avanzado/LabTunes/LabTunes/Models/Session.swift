//
//  Session.swift
//  LabTunes
//
//  Created by Abraham Quezada on 11/9/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation

class Session: NSObject{
    var token: String?
    static let sharedInstance = Session()
    
    //No puedes mandar a llamar al init desde otra parte sino solamente de aqui
    //Esto para evitar multiples sesiones
    override private init(){
        super.init()
    }
    
    func saveSession(){
        token = "1234567890"
    }
}
