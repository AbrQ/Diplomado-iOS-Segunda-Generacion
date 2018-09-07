//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

struct Results: Codable{
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Codable{
    var artistName: String
    var trackName: String
    var artworkUrl100: String
}

let BaseUrl = URL(string: "https://itunes.apple.com/search?term='metallica'")

extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{ URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

let query : [String: String] = [
    "term" : "metallica",
    "limit" : "10"
]

let url = BaseUrl?.withQueries(query)

let jsonDecoder = JSONDecoder()

let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
    if let data = data, let trackDictionary = try? jsonDecoder.decode(Results.self, from: data){
   // if let data = data, let string = String(data: data, encoding: .utf8){
        trackDictionary.results.forEach({ (track) in
            print(track.artistName, track.trackName, track.artworkUrl100)
        })
    }
}

task.resume()
PlaygroundPage.current.needsIndefiniteExecution = true
