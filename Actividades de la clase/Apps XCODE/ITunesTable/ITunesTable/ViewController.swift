//
//  ViewController.swift
//  ITunesTable
//
//  Created by Abraham Quezada on 01/09/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablita: UITableView!
    
    
    var tracks: [Tracks] = []
    let BaseUrl = URL(string: "https://itunes.apple.com/search?term='coldplay'")
    
    let query : [String: String] = [
        "term" : "coldplay",
        "limit" : "30"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = tracks[indexPath.row].trackName
        do{
        let urlImage = URL(string: tracks[indexPath.row].artworkUrl100)
        let dataImage = try Data(contentsOf: urlImage!)
        cell.imageView?.image = UIImage(data: dataImage)
        }catch{
            print(error)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tracks.remove(at: indexPath.row)
            tablita.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completion) in
            self.tracks.remove(at: indexPath.row)
            self.tablita.deleteRows(at: [indexPath], with: .fade)
        }

        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceview, completion) in
            let text = "Listening: " + self.tracks[indexPath.row].trackName
            let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            self.present(activityController, animated: true)
           
        }
        
        shareAction.backgroundColor = UIColor.brown
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond"{
            let indexPath = tablita.indexPathForSelectedRow
            let destination = segue.destination as! SecondViewController
            //let urlImage = URL(string: tracks[indexPath.row].artworkUrl100)
            destination.fromFirstView = tracks[(indexPath?.row)!].trackName
            destination.imageName = tracks[(indexPath?.row)!].artworkUrl100
        }
    }
    
    func fetchData(){
        
        let url = BaseUrl?.withQueries(query)
        
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            if let data = data, let trackList = try? jsonDecoder.decode(Results.self, from: data){
                // if let data = data, let string = String(data: data, encoding: .utf8){
                //let temp: [Tracks] = []
                trackList.results.forEach({ (track) in
                    self.tracks.append(track)
                    self.tablita.reloadData()
                })
                //self.tracks = temp
                
            }
        }
        
        task.resume()
    }
}

extension URL{
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{ URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

