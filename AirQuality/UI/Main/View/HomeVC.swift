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
    
    @objc func tappedSetLat(){
        let vc = CoordinateVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            
        }
    }
    
    @objc func tappedSetLon(){
        let vc = CoordinateVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
}

