//
//  MasterViewController.swift
//  Worldb
//
//  Created by Abraham Quezada on 9/29/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var objects = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == "showCountry" {
            let object = objects[indexPath.row]
            let controller = segue.destination as! CountryViewController
            controller.country = object
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let object = objects[indexPath.row]
        cell.textLabel?.text = object.name
        cell.detailTextLabel?.text = object.iso
        return cell
    }
    
    func setTheme()  {
        if UserDefaults.standard.bool(forKey: "nightTheme"){
            self.navigationController?.navigationBar.barTintColor = UIColor.blue
            self.navigationController?.navigationBar.tintColor = UIColor.aqua
            self.tableView.backgroundColor = UIColor.blue
            self.tableView.tintColor = UIColor.sand
            self.tableView.separatorColor = UIColor.aqua
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor.aqua
            self.navigationController?.navigationBar.tintColor = UIColor.blue
            self.tableView.backgroundColor = UIColor.sand
            self.tableView.tintColor = UIColor.blue
            self.tableView.separatorColor = UIColor.pink
        }
    }
    
    func loadData() {
        CountryService.shared.all { [weak self] countries in
            self?.objects = countries
            self?.tableView.reloadData()
        }
    }
}

