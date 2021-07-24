//
//  ViewController.swift
//  AirQuality
//
//  Created by phong070 on 22/07/2021.
//

import UIKit
import GoogleMaps
import SnapKit

class HomeVC : UIViewController {

    let viewModel = HomeViewModel(service: Dependencies.coordinateService)
    lazy var latButton : UIButton = {
        let view : UIButton = UIButton()
        view.setTitle("Set Lat", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    lazy var lonButton : UIButton = {
        let view : UIButton = UIButton()
        view.setTitle("Set Lon", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    lazy var clearButton : UIButton = {
        let view : UIButton = UIButton()
        view.setTitle("Clear", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    lazy var latLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textAlignment = .center
        return view
    }()
    
    lazy var lonLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textAlignment = .center
        return view
    }()
    
    lazy var stackViewAction : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .fill
        return view
    }()
    
    
    lazy var stackViewDisplay : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    @objc func tappedSetLat(){
        viewModel.addAction(action: .LAT)
        let vc = CoordinateVC(requestType: .LAT,action : viewModel.actions)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            
        }
    }
    
    @objc func tappedSetLon(){
        viewModel.addAction(action: .LON)
        let vc = CoordinateVC(requestType: .LON,action: viewModel.actions)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            
        }
    }
    
    @objc func tappedClear(){
        viewModel.handleReset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindingEvent()
    }
    
    
    private func bindingEvent(){
        viewModel.onChangedLat = { [weak self] data in
            DispatchQueue.main.async {
                self?.latLabel.text = data
            }
        }
        viewModel.onChangedLon = { [weak self] data in
            DispatchQueue.main.async {
                self?.lonLabel.text = data
            }
        }
    }
}

