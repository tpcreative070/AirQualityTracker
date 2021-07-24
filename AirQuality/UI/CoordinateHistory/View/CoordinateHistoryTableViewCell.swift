//
//  CoordinateHistoryTableViewCell.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import UIKit
class CoordinateHistoryTableViewCell : UITableViewCell {
    var delegate : TableViewCellDelegate?
    lazy var addressLabel : UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var airQualityLabel : UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var latLabel : UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var lonLabel : UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ vm : CoordinateHistoryViewModelProtocol){
        self.addressLabel.text = vm.addressView
        self.airQualityLabel.text = vm.airQualityView
        self.latLabel.text = vm.latView
        self.lonLabel.text = vm.lonView
    }
    
    @objc func tappedCell() {
        delegate?.viewSelected(cell: self)
    }
}
