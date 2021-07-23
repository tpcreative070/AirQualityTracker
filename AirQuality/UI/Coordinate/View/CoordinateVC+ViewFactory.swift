//
//  ShowMapVC+ViewFactory.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import GoogleMaps

extension CoordinateVC {
    
    func initUI(){
       setupConstraint()
    }
    
    private func setupConstraint(){
        self.view.addSubview(mapView)
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 10.823370, longitude: 106.638580)
        marker.map = mapView
        //MARK: close button
        self.view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(tappedClose), for: .touchUpInside)
        closeButton.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.width.height.equalTo(50)
        }
    }
    
    func changeMarker(lat : Double, lon : Double){
        self.mapView.clear()
        marker = GMSMarker()
        marker.appearAnimation = .pop
        currentCoordinate = CLLocationCoordinate2D(latitude:lat , longitude: lon)
        marker.position = currentCoordinate
        marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        DispatchQueue.main.async {
            self.marker.map = self.mapView
        }
    }
    
    func changedAddress(name : String){
        self.mapView.clear()
        marker = GMSMarker()
        marker.title = name
        marker.appearAnimation = .pop
        marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.position = currentCoordinate
        DispatchQueue.main.async {
            self.marker.map = self.mapView
            self.mapView.selectedMarker = self.marker
        }
    }
}
