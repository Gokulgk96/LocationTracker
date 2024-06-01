//
//  ViewController.swift
//  LocationTracker
//
//  Created by Gokul Gopalakrishnan on 28/05/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    
    @IBOutlet weak var Receive: UIButton!
    @IBOutlet weak var Send: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.Send?.backgroundColor = .blue
        self.Send?.layer.cornerRadius = 20
        self.Receive?.backgroundColor = .blue
        self.Receive?.layer.cornerRadius = 20
    }
    
    @IBAction func SendAction(_ sender: Any) {
        let send = SendViewController()
        self.present(send, animated: true, completion: nil)
    }
    
    @IBAction func ReceiveAction(_ sender: Any) {
        let receive = ReceiveViewController()
        self.present(receive, animated: true, completion: nil)
    }
}



extension ViewController: CLLocationManagerDelegate {
   
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let location = locations.last else { return }
                print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
            }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager?.stopUpdatingLocation()

           if let clErr = error as? CLError {
               switch clErr.code {
               case .locationUnknown, .denied, .network:
                   print("Location request failed with error: \(clErr.localizedDescription)")
               case .headingFailure:
                   print("Heading request failed with error: \(clErr.localizedDescription)")
               case .rangingUnavailable, .rangingFailure:
                   print("Ranging request failed with error: \(clErr.localizedDescription)")
               case .regionMonitoringDenied, .regionMonitoringFailure, .regionMonitoringSetupDelayed, .regionMonitoringResponseDelayed:
                   print("Region monitoring request failed with error: \(clErr.localizedDescription)")
               default:
                   print("Unknown location manager error: \(clErr.localizedDescription)")
               }
           } else {
               print("Unknown error occurred while handling location manager error: \(error.localizedDescription)")
           }
       }
}
