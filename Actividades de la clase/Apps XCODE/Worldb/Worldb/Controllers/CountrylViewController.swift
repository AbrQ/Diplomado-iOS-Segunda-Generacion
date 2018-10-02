//
//  DetailViewController.swift
//  Worldb
//
//  Created by Abraham Quezada on 9/29/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    var country: Country? {
        didSet { loadData() }
    }
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryLanguagesLabel: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    
    func loadData() {
        guard let country = country else { return }
        countryNameLabel?.text = country.name
        countryLanguagesLabel?.text = country.languages.joined(separator: ", ")
        country.flagImage { [weak self] img in
            self?.countryFlag?.image = img
        }
    }
    
    func setTheme()  {
        if UserDefaults.standard.bool(forKey: "nightTheme"){
            self.view.backgroundColor = UIColor.blue
            self.view.tintColor = UIColor.sand
        } else {
            self.view.backgroundColor = UIColor.sand
            self.view.tintColor = UIColor.blue
        }
    }
}

