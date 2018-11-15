//
//  Request.swift
//  LabTunes
//
//  Created by Abraham Quezada on 11/14/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation
import Alamofire

let baseURL = "https://itunes.apple.com/search"

struct Request
{
    static func searchArtists(withText text: String,
                              successBlock: @escaping ([Music]) -> Void,
                              failureBlock: @escaping (Error) -> Void)
    {
        let parameters: [String: Any] = ["entity": "musicArtist",
                                         "limit": 25,
                                         "term": text]
        
        Alamofire.request(baseURL,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default).validate().responseJSON { (response) in
                            
                            if let error = response.error
                            {
                                failureBlock(error)
                                return
                            }
                            
                            let artists = Music.parseArtists(fromData: response.result.value as! [String: Any])
                            
                            successBlock(artists)
        }
    }
}

