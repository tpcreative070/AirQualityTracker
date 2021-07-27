//
//  AirQualityVC.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit

class AirQualityVC : UIViewController {
    var viewModel : AirQualityViewModel!
    lazy var pointATitleLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "Point A"
        view.font = .systemFont(ofSize: 22)
        return view
    }()
    
    lazy var pointBTitleLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "Point B"
        view.font = .systemFont(ofSize: 22)
        return view
    }()
    
    lazy var pointAStackView : UIStackView = {
        let view : UIStackView = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .fill
        return view
    }()
    
    
    lazy var pointALabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .blue
        return view
    }()
    
    lazy var pointBLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .blue
        return view
    }()
    
    lazy var pointAAddressLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .blue
        return view
    }()
    
    lazy var pointAAirQualityLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .purple
        return view
    }()
    
    lazy var pointBAddressLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .blue
        return view
    }()
    
    lazy var pointBAirQualityLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .purple
        return view
    }()
    
    
    lazy var pointBStackView : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 20
        return view
    }()
    
    lazy var closeButton : UIButton = {
        let view = UIButton()
        view.setTitle("Close", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    @objc func tappedClose(){
        dismiss(animated: false, completion: nil)
    }
    
    init(pointA : CoordinateHistoryViewModel?, pointB : CoordinateHistoryViewModel?) {
        super.init(nibName: nil, bundle: nil)
        viewModel = AirQualityViewModel(pointA: pointA,pointB : pointB)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindingEvent()
    }
    
    func bindingEvent(){
        viewModel.onPointA = { [weak self] data in
            self?.pointALabel.text = data
        }
       
        viewModel.onPointAAddress = { [weak self] data in
            self?.pointAAddressLabel.text = data
        }

        viewModel.onPointAAirQuality = { [weak self] data in
            self?.pointAAirQualityLabel.text = data
        }
       
        viewModel.onPointB = { [weak self] data in
            self?.pointBLabel.text = data
        }
        viewModel.onPointBAddress = { [weak self] data in
            self?.pointBAddressLabel.text = data
        }
        viewModel.onPointBAirQuality = { [weak self] data in
            self?.pointBAirQualityLabel.text = data
        }
        
        viewModel.handleDisplayData()
    }
}

