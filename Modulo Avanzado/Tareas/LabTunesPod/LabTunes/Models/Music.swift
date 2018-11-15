//
//  Music.swift
//  LabTunes
//
//  Created by Abraham Quezada on 11/9/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation
import Alamofire

class Music{
    var id: Int64?
    var name: String?
    //var song: String?
    
    init(withData data: [String: Any])
    {
        if let id = data["artistId"] as? Int64,
            let name = data["artistName"] as? String
            //let song = data["trackName"] as? String
        {
            self.id = id
            self.name = name
            //self.song = song
        }
    }
    
    class func parseArtists(fromData data: [String: Any]) -> [Music]
    {
        var items = [Music]()
        
        if let artists = data["results"] as? [[String: Any]]
        {
            for artistData in artists
            {
                items.append(Music(withData: artistData))
            }
        }
        
        return items
    }
}
