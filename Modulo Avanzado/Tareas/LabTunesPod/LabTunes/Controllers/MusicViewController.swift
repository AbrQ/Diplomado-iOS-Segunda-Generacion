//
//  MusicViewController.swift
//  LabTunes
//
//  Created by Abraham Quezada on 11/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController{
    var artists = [Music]()
    
    @IBOutlet weak var musicTableView: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    private func proceedSearchAction(withText text: String){
        Request.searchArtists(withText: text,
                                  successBlock: { (artists) in
                                    
                                    self.artists = artists
                                    self.musicTableView.reloadData()
        }) { (error) in
            print(error)
        }
    }

}

extension MusicViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.musicTableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        
        cell.textLabel?.text = self.artists[indexPath.row].name
        
        return cell
    }
}

// MARK: - UIScrollViewDelegate

extension MusicViewController: UIScrollViewDelegate
{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        self.view.endEditing(true)
    }
}

// MARK: - UISearchBarDelegate

extension MusicViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.proceedSearchAction(withText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.searchField.resignFirstResponder()
        
        if let text = self.searchField.text, !text.isEmpty
        {
            self.proceedSearchAction(withText: text)
        }
    }
}
