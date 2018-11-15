//
//  MusicViewController.swift
//  LabTunesXIB
//
//  Created by Abraham Quezada on 11/14/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet var myTableView: UITableView!
 
    
    var songs: [Song] = []
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupSearchBar()
        setupSearchBar()
        downloadSongs()
    }
    
    func downloadSongs(){
        Music.fetchSongs { (results: [Song]) in
            self.songs = results
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
    
    func downloadSongsByName(name: String){
        Music.fetchSongs(songName: name){ (results: [Song]) in
            self.songs = results
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
    
    func setupSearchBar(){
        self.myTableView.tableHeaderView = self.searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Songs"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}



extension MusicViewController: UITableViewDataSource{
    //func numberOfSections(in tableView: UITableView) -> Int {
     //   return 1
    //}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let simpleTableIdentifier: NSString = "MusicCell"
        var cell: CustomTableViewCell! = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier as String) as? CustomTableViewCell
            if cell == nil{
                let nib: [CustomTableViewCell] = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil) as! [CustomTableViewCell]
                cell = nib[0]
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.textLabel?.text = songs[indexPath.row].name
        }
        return cell
    }
    
}

extension MusicViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        downloadSongsByName(name: searchController.searchBar.text!)
    }
}

