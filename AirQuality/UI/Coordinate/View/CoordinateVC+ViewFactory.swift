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
        setFooterForConstraint()
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
            make.height.equalTo(50)
            make.width.equalTo(80)
        }
    }
    
    private func setFooterForConstraint(){
        self.view.addSubview(stackViewAction)
        self.stackViewAction.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            make.leading.equalTo(self.view).offset(50)
            make.trailing.equalTo(self.view).offset(-50)
            make.bottom.equalTo(self.view).offset(-50)
            make.height.equalTo(50)
        }
        stackViewAction.addArrangedSubview(setCoordinateButton)
        stackViewAction.addArrangedSubview(historyButton)
        
        setCoordinateButton.addTarget(self, action: #selector(tappedSet), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(tappedHistory), for: .touchUpInside)
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
    
    func changedAddress(name : String,aqi : String){
        self.mapView.clear()
        marker = GMSMarker()
        marker.title = name
        marker.snippet = "Air Quality: \(aqi)"
        marker.appearAnimation = .pop
        marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.position = currentCoordinate
        DispatchQueue.main.async {
            self.marker.map = self.mapView
            self.mapView.selectedMarker = self.marker
        }
    }
}
