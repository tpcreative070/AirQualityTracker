//
//  ViewController.swift
//  AirQuality
//
//  Created by phong070 on 22/07/2021.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: 10.823370, longitude:106.638580, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
               // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 10.823370, longitude: 106.638580)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}

