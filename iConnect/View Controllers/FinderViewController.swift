//
//  FinderViewController.swift
//  iConnect
//
//  Created by Maxim Zvenigorodsky on 23.10.2020.
//

import UIKit
import MapKit

class FinderViewController: UIViewController {

    @IBOutlet weak var mainMapView:
        MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Finder"
        let initialLocation = CLLocation(latitude: 55.6962383, longitude: 37.2989158)
        //MKMapView.centerToLocation(initialLocation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnbled()
        checkAutorization(locationManager)
    }
    
    func checkLocationEnbled(){
        if CLLocationManager.locationServicesEnabled(){
            setupManager()
        }else{
            showAlert(title: "Turn on geolocation", message: "Want to enable?", url: URL (string: "App-prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkAutorization(_ manager: CLLocationManager){
        let accuracyAuthorization = manager.accuracyAuthorization
            switch accuracyAuthorization {
            case .fullAccuracy:
            break
            case .reducedAccuracy:
                showAlert(title: "No premises for geolocation", message: "want to enable?", url: URL(string: UIApplication.openSettingsURLString))
                break
            default:
                break
            }
    }
    
    func showAlert(title:String,message:String?,url:URL?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
            if let url = url{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
   
}

extension FinderViewController:CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
//        if let location = locations.last?.coordinate{
//            let region = MKCoordinateRegion(center: location, latitudinalMeters: 50, longitudinalMeters: 50)
//            mainMapView.setRegion(region, animated: true)
//        }
//    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

