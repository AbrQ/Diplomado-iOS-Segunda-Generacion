//
//  LocationViewController.swift
//  FiveSenses
//
//  Created by Abraham Quezada on 10/19/18.
//  Copyright © 2018 fi.unam.mx. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var latitudLabel: UILabel!
    @IBOutlet weak var longitudLabel: UILabel!
    @IBOutlet weak var altitudLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    let manager = CLLocationManager()
    
    var isActive: Bool? = false{
        didSet{
            guard let active = isActive else{ return }
            if active{
                startButton.setTitle("Stop", for: .normal)
            }else{
                startButton.setTitle("Start", for: .normal)
            }
        }
    }
    
    func enableBasicLocationServices() {
        manager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            manager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
            //disableMyLocationBasedFeatures()
            break
            
        case .authorizedWhenInUse, .authorizedAlways:
            // Enable location features
            enableWhenInUseFeatures()
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enableBasicLocationServices()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onTapStar(_ sender: UIButton) {
        self.isActive = !(isActive ?? false)
        if isActive!{
            enableBasicLocationServices()
            
        }else{
            resetValues()
    }
}
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        latitudLabel.text = location.coordinate.latitude.format()
        longitudLabel.text = location.coordinate.longitude.format()
        altitudLabel.text = location.altitude.format()
    }
    
    func enableWhenInUseFeatures(){
        manager.startUpdatingLocation()
    }
    
    func resetValues(){
        latitudLabel.text = "0"
        longitudLabel.text = "0"
        altitudLabel.text = "0"
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
