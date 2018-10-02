//
//  CuntryService.swift
//  Worldb
//
//  Created by Abraham Quezada on 10/2/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation

class CountryService {
    static let shared = CountryService()
    let client = Client(baseURLComponents: URLComponents(string: "https://worldb.herokuapp.com")!)
    func all(completion: @escaping ([Country]) -> Void) {
        if let res = CodableStorage<[Country]>.permanent(filename: "countries.json").load() {
            completion(res)
        }
        client.get(path: "/api/countries") { data in
            guard let data = data else { return }
            if let result = try? JSONDecoder().decode([Country].self, from: data) {
                CodableStorage<[Country]>.permanent(filename: "countries.json").save(data: result)
                DispatchQueue.main.async { completion(result) }
            }
        }
    }
}
