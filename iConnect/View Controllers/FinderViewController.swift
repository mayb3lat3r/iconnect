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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Finder"
        let initialLocation = CLLocation(latitude: 55.6962383, longitude: 37.2989158)
        mainMapView.centerToLocation(initialLocation)
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
