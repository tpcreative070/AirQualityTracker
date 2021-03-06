//
//  CoordinateHistoryTableViewCell+ViewFactory.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//
import UIKit

extension CoordinateHistoryTableViewCell {
    
    func initUI(){
        setupConstraint()
    }
    
    private func setupConstraint(){
        addSubview(stackView)
        stackView.snp.makeConstraints { [weak self] make in
            guard let self = self else{
                return
            }
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(airQualityLabel)
        stackView.addArrangedSubview(coordinateLabel)
        stackView.addArrangedSubview(createdDateLabel)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedCell))
        self.addGestureRecognizer(tapGesture)
    }
    
}
