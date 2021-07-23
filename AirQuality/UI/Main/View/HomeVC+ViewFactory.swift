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
        latButton.backgroundColor = .green
        latButton.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        latButton.addTarget(self, action: #selector(tappedSetLat), for: .touchUpInside)
    }
    
    @objc func tappedSetLat(){
        let vc = CoordinateVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            
        }
    }
}
