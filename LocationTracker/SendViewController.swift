//
//  SendViewController.swift
//  LocationTracker
//
//  Created by Gokul Gopalakrishnan on 29/05/24.
//

import UIKit

class SendViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.view.backgroundColor = .blue
        
        locationManager?.requestWhenInUseAuthorization()
        requestOnTimeLocation()
        
        
    }
    
    private func requestOnTimeLocation() {
        locationManager?.requestLocation()
    }
}

