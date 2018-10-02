//
//  Country.swift
//  Worldb
//
//  Created by Abraham Quezada on 10/2/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

struct Country: Codable {
    let id: Int
    let name: String
    let iso: String
    let languages: [String]
    
    func flag() -> URL {
        return  URL(string: "https://www.countryflags.io/\(iso)/flat/64.png")!
    }
    
    func flagImage(completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let imgData = try? Data(contentsOf: self.flag()),
                let img = UIImage(data: imgData) {
                DispatchQueue.main.async { completion(img) }
            }
        }
    }
}

