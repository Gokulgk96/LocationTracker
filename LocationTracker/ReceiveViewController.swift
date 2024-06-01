//
//  ReceiveViewController.swift
//  LocationTracker
//
//  Created by Gokul Gopalakrishnan on 29/05/24.
//

import UIKit

class ReceiveViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.view.backgroundColor = .green
        
        locationManager?.requestWhenInUseAuthorization()
        requestOnTimeLocation()
        
        
    }
    
    private func requestOnTimeLocation() {
        locationManager?.requestLocation()
    }
}
