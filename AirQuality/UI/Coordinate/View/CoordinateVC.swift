//
//  ShowMapVC.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit
import GoogleMaps

class CoordinateVC : UIViewController {
    
    let viewModel = CoordinateViewModel(service: Dependencies.coordinateService)
    var marker = GMSMarker()
    var currentCoordinate = CLLocationCoordinate2D(latitude: 10.823370, longitude: 106.638580)
    lazy var mapView : GMSMapView = {
        let camera = GMSCameraPosition.camera(withLatitude: 10.823370, longitude:106.638580, zoom: 20)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        return mapView
    }()
    
    
    lazy var closeButton : UIButton = {
        let view = UIButton()
        view.setTitle("Close", for: .normal)
        view.setTitleColor(.gray, for: .normal)
        return view
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindingEvent()
        self.mapView.delegate = self
    }
    
    private func bindingEvent(){
        viewModel.onChanged = { [weak self] name in
            self?.changedAddress(name: name)
        }
        
        viewModel.onError = { [weak self] message in
            print(message)
        }
        viewModel.fetchingCoordinateData(lat: "10.823370", lon: "106.638580")
    }
    
    
    @objc func tappedClose(){
        dismiss(animated: true, completion: nil)
    }
}


extension CoordinateVC : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        DispatchQueue.main.async {
            let mLat = mapView.camera.target.latitude
            let mLon = mapView.camera.target.longitude
            self.changeMarker(lat: mLat, lon: mLon)
            self.viewModel.fetchingCoordinateData(lat: String(mLat), lon: String(mLon))
        }
    }
}
