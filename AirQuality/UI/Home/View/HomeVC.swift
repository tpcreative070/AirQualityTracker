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
 
    lazy var pointAButton : UIButton = {
        let view : UIButton = UIButton()
        view.setTitle("Point A", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    lazy var pointButton : UIButton = {
        let view : UIButton = UIButton()
        view.setTitle("Point B", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    lazy var clearButton : UIButton = {
        let view : UIButton = UIButton()
        view.setTitle("Clear", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    lazy var poinALabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = ""
        view.textAlignment = .center
        return view
    }()
    
    lazy var pointBLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = ""
        view.textAlignment = .center
        return view
    }()
    
    lazy var titleLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "Air Quality Tracker"
        view.font = UIFont.boldSystemFont(ofSize: 20.0)
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    lazy var stackViewAction : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 20
        return view
    }()
    
    
    lazy var stackViewDisplay : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    @objc func tappedPointA(){
        viewModel.addAction(action: .POINT_A)
        let vc = CoordinateVC(requestType: .POINT_A,action : viewModel.actions)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
    }
    
    @objc func tappedPointB(){
        viewModel.addAction(action: .POINT_B)
        let vc = CoordinateVC(requestType: .POINT_B,action: viewModel.actions)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
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
        viewModel.onChangedPointA = { [weak self] data in
            DispatchQueue.main.async {
                self?.poinALabel.attributedText = data.attributedStringWithColor(["Point A","{","}"], color: .blue)
            }
        }
        viewModel.onChangedPointB = { [weak self] data in
            DispatchQueue.main.async {
                self?.pointBLabel.attributedText = data.attributedStringWithColor(["Point B","{","}"], color: .blue)
            }
        }
    }
}

