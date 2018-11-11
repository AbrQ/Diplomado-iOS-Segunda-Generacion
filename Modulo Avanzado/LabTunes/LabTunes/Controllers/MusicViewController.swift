//
//  MusicViewController.swift
//  LabTunes
//
//  Created by Abraham Quezada on 11/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate{
    
    var songs: [Song] = []
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        downloadSongs()
        setupSearchBar()
    }
    
    func downloadSongs(){
        Music.fetchSongs { (results: [Song]) in
            self.songs = results
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
    
    func downloadSongsByName(name: String){
        Music.fetchSongs(songName: name){ (results: [Song]) in
            self.songs = results
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
    
    func setupSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Songs"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MusicViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].artist
        return cell
    }
}

extension MusicViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        downloadSongsByName(name: searchController.searchBar.text!)
    }
}
