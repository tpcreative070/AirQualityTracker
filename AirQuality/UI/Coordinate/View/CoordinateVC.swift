//
//  ShowMapVC.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit
import GoogleMaps
import RxSwift
import PKHUD
enum EnumType {
    case POINT_A
    case POINT_B
}
class CoordinateVC : UIViewController {
    
    let viewModel = CoordinateViewModel(Dependencies.coordinateService,Dependencies.airQualityService)
    var marker = GMSMarker()
    var currentCoordinate : CLLocationCoordinate2D!
    lazy var mapView : GMSMapView = {
        let view = GMSMapView()
        return view
    }()
    
    init(requestType : EnumType, action : [Int:Int]){
        super.init(nibName: nil, bundle: nil)
        viewModel.setRequestType(type: requestType,actions: action)
    }
    
    init(data : CoordinateHistoryViewModel){
        super.init(nibName: nil, bundle: nil)
        viewModel.setLocation(lat: data.latOrginal, lon: data.lonOriginal)
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
        bindingEvent()
        initUI()
    }
    
    private func bindingEvent(){
        viewModel.onChanged = { [weak self] name,aqi in
            self?.changedAddress(name: name,aqi: aqi)
        }
        
        viewModel.onDone = { [weak self] in
            self?.dismiss(animated: false, completion: nil)
        }
        viewModel.onNavigator = { [weak self] pointA,pointB in
            let vc = AirQualityVC(pointA: pointA, pointB: pointB)
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        }
        
        viewModel.onLoading = { [weak self] isLoading in
            guard let _ = self else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    HUD.show(.progress)
                }else{
                    HUD.hide()
                }
            }
        }
        
        viewModel.onInitializedMap = { [weak self] lat, lon in
           guard let self = self else {
               return
           }
           self.currentCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
           let camera = GMSCameraPosition.camera(withLatitude: lat, longitude:lon, zoom: 20)
           self.mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
           self.mapView.delegate = self
           self.changeMarker(lat: lat, lon: lon)
           self.viewModel.fetchingCoordinateData(lat: lat.description, lon: lon.description)
        }
        viewModel.initilizedUI()
        
        mapView.rx.didChange.asDriver()
            .debounce(.seconds(1))
            .drive(onNext: { [weak self] camera in
                guard let self = self else {
                    return
                }
                DispatchQueue.main.async {
                    let mLat = camera.target.latitude
                    let mLon = camera.target.longitude
                    self.viewModel.fetchingCoordinateData(lat: String(mLat), lon: String(mLon))
                }
            })
            .disposed(by: viewModel.disbag)
    }
    
    @objc func tappedClose(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedSet(){
        viewModel.handleSendCoordinate()
    }
    
    @objc func tappedHistory(){
        let vc = CoordinateHistoryVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
    }
    
    deinit {
        HUD.hide()
    }
}

extension CoordinateVC : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        DispatchQueue.main.async {
            let mLat = mapView.camera.target.latitude
            let mLon = mapView.camera.target.longitude
            self.viewModel.setLocation(lat: String(mLat), lon: String(mLon))
            self.changeMarker(lat: mLat, lon: mLon)
        }
    }
}
