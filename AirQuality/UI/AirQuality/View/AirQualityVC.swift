//
//  AirQualityVC.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit

class AirQualityVC : UIViewController {
    var viewModel : AirQualityViewModel!
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
    
    lazy var stackViewLocation : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 20
        view.alignment = .fill
        return view
    }()
    
    lazy var addressLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .blue
        view.textAlignment = .center
        return view
    }()
    
    lazy var airQualityLabel : UILabel = {
        let view : UILabel = UILabel()
        view.text = "0.0"
        view.textColor = .purple
        view.textAlignment = .center
        return view
    }()
    
    lazy var stackViewDisplay : UIStackView = {
        let view : UIStackView = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .fill
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
    
    init(data : CoordinateHistoryViewModel) {
        super.init(nibName: nil, bundle: nil)
        viewModel = AirQualityViewModel(data: data)
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
        viewModel.onLat = { [weak self] data in
            self?.latLabel.text = data
        }
        viewModel.onLon = { [weak self] data in
            self?.lonLabel.text = data
        }
        viewModel.onAddress = { [weak self] data in
            self?.addressLabel.text = data
        }
        viewModel.onAirQuality = { [weak self] data in
            self?.airQualityLabel.text = data
        }
        viewModel.handleDisplayData()
    }
}

