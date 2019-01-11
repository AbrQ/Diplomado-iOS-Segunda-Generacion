//
//  main.swift
//  MainInSwift
//
//  Created by Abraham Quezada on 1/11/19.
//  Copyright © 2019 Abraham Quezada. All rights reserved.
//

import UIKit

class MyApplication: UIApplication{
    override func sendEvent(_ event: UIEvent){
        super.sendEvent(event)
        print("Event sent: \(event)");
    }
}

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(MyApplication.self), NSStringFromClass(AppDelegate.self))
