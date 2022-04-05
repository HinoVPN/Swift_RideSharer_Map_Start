//
//  ViewController.swift
//  RideSharer
//
//  Created by stockviva on 5/4/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
      super.viewDidLoad()
        mapView.showsBuildings = true
        checkLocationServices()
    }
    func checkLocationServices() {
           if CLLocationManager.locationServicesEnabled() {
               checkAuthorizationStatus()
           } else {
              // Do something to let users know why they need to turn it on.
           }
       }

       
       
       func checkAuthorizationStatus(){
           let locationManager = CLLocationManager()
        
           switch locationManager.authorizationStatus {
               case .denied:
                print("denied")
                   break
               case .notDetermined:
                   locationManager.requestWhenInUseAuthorization()
               case .restricted:
                print("restricted")
           case .authorizedAlways,.authorizedWhenInUse: break
           @unknown default:
                   break
           }
       }


}

