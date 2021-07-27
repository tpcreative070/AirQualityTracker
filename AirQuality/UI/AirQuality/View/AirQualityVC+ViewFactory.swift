//
//  AirQualityVC+ViewFactory.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import UIKit

extension AirQualityVC  {
    func initUI(){
        self.view.backgroundColor = .white
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
        
        self.view.addSubview(pointATitleLabel)
        pointATitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(200)
            make.leading.equalTo(self.view).offset(50)
            make.trailing.equalTo(self.view).offset(-50)
        }
        
   
        self.view.addSubview(pointAStackView)
        pointAStackView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
            make.height.equalTo(150)
            make.bottom.equalTo(pointATitleLabel).offset(200)

        }
        pointAStackView.addArrangedSubview(pointALabel)
        pointAStackView.addArrangedSubview(pointAAddressLabel)
        pointAStackView.addArrangedSubview(pointAAirQualityLabel)
        
        
        self.view.addSubview(pointBTitleLabel)
        pointBTitleLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(50)
            make.trailing.equalTo(self.view).offset(-50)
            make.bottom.equalTo(pointAStackView).offset(50)
        }
        
        self.view.addSubview(pointBStackView)
        pointBStackView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(50)
            make.trailing.equalTo(self.view).offset(-50)
            make.height.equalTo(150)
            make.bottom.equalTo(pointBTitleLabel).offset(200)
           
        }
        pointBStackView.addArrangedSubview(pointBLabel)
        pointBStackView.addArrangedSubview(pointBAddressLabel)
        pointBStackView.addArrangedSubview(pointBAirQualityLabel)
    }
}
