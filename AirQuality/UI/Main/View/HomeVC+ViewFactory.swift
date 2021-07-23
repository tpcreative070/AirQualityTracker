//
//  HomeVC+ViewFactory.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation

extension HomeVC {
    func initUI(){
        setupConstraint()
    }
    
    private func setupConstraint(){
        self.view.backgroundColor = .white
        self.view.addSubview(latButton)
        latButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.center.equalTo(self.view)
        }
        self.view.addSubview(lonButton)
        lonButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(latButton).offset(50)
        }
        latButton.addTarget(self, action: #selector(tappedSetLat), for: .touchUpInside)
        lonButton.addTarget(self, action: #selector(tappedSetLon), for: .touchUpInside)
    }
}
