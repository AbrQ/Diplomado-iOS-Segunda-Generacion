//
//  ViewController.swift
//  CacheExcercise
//
//  Created by Abraham Quezada on 10/6/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    let baseURLComponents = URLComponents(string: "https://example.com")
    func request(_ method: String, path: String, body: Data?, authToken: String?, successHandler: dataHandler?) {
        var requestURLComponents = baseURLComponents
        requestURLComponents?.path = path
        var request = URLRequest(url: (requestURLComponents?.url!)!)
        request.httpMethod = method
        request.httpBody = body
        if let token = authToken {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil { return }
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200, let handler = successHandler {
                handler(data)
            }
        }
        task.resume()
    }
}
