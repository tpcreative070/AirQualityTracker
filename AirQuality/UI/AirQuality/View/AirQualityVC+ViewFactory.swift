//
//  AirQualityVC+ViewFactory.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit

extension AirQualityVC  {
    func initUI(){
        setupConstraint()
    }
    
    private func setupConstraint(){
        self.view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(tappedClose), for: .touchUpInside)
        closeButton.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(50)
            make.width.equalTo(80)
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(stackViewLocation)
        
        stackViewLocation.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.top.equalTo(view).offset(200)
            make.leading.equalTo(self.view).offset(50)
            make.trailing.equalTo(self.view).offset(-50)
           
        }
        stackViewLocation.addArrangedSubview(latLabel)
        stackViewLocation.addArrangedSubview(lonLabel)
        
        self.view.addSubview(stackViewDisplay)
        stackViewDisplay.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.bottom.equalTo(stackViewLocation).offset(50)
        }
        
        stackViewDisplay.addArrangedSubview(addressLabel)
        stackViewDisplay.addArrangedSubview(airQualityLabel)
    }
}
