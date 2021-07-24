//
//  ShowMapVC.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit
import GoogleMaps
enum EnumType {
    case LAT
    case LON
}
class CoordinateVC : UIViewController {
    
    let viewModel = CoordinateViewModel(Dependencies.coordinateService,Dependencies.airQualityService)
    var marker = GMSMarker()
    var currentCoordinate = CLLocationCoordinate2D(latitude: 10.823370, longitude: 106.638580)
    lazy var mapView : GMSMapView = {
        let camera = GMSCameraPosition.camera(withLatitude: 10.823370, longitude:106.638580, zoom: 20)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        return mapView
    }()
    
    init(requestType : EnumType, action : [Int:Int]){
        super.init(nibName: nil, bundle: nil)
        viewModel.setRequestType(type: requestType,actions: action)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackViewAction : UIStackView = {
        let view : UIStackView = UIStackView()
        view.alignment = .fill
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    
    lazy var setCoordinateButton : UIButton = {
        let view = UIButton()
        view.setTitle("Set", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    lazy var historyButton : UIButton = {
        let view = UIButton()
        view.setTitle("History", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    lazy var closeButton : UIButton = {
        let view = UIButton()
        view.setTitle("Close", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindingEvent()
        self.mapView.delegate = self
    }
    
    private func bindingEvent(){
        viewModel.onChanged = { [weak self] name,aqi in
            self?.changedAddress(name: name,aqi: aqi)
        }
        
        viewModel.onError = { [weak self] message in
            print(message)
        }
        
        viewModel.onDone = { [weak self] in
            self?.dismiss(animated: false, completion: nil)
        }
        viewModel.onNavigator = { [weak self] data in
            let vc = AirQualityVC(data: data)
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        }
        self.changeMarker(lat: Double("10.823370") ?? 0, lon: Double("106.638580") ?? 0)
        viewModel.fetchingCoordinateData(lat: "10.823370", lon: "106.638580")
    }
    
    @objc func tappedClose(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedSet(){
        viewModel.handleSendCoordinate()
    }
    
    @objc func tappedHistory(){
        viewModel.handleSendCoordinate()
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
