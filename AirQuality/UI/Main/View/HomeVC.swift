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
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
}

