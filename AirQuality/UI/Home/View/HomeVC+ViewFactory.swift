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
        
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(200)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
        }
        
        self.view.addSubview(stackViewAction)
        
        stackViewAction.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.bottom.equalTo(titleLabel).offset(100)
            make.leading.equalTo(self.view).offset(50)
            make.trailing.equalTo(self.view).offset(-50)
           
        }
        stackViewAction.addArrangedSubview(pointAButton)
        stackViewAction.addArrangedSubview(pointButton)
        stackViewAction.addArrangedSubview(clearButton)
        
        self.view.addSubview(stackViewDisplay)
        stackViewDisplay.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.leading.equalTo(self.view).offset(10)
            make.trailing.equalTo(self.view).offset(-10)
            make.bottom.equalTo(stackViewAction).offset(70)
        }
        stackViewDisplay.addArrangedSubview(poinALabel)
        stackViewDisplay.addArrangedSubview(pointBLabel)
       
        pointAButton.addTarget(self, action: #selector(tappedPointA), for: .touchUpInside)
        pointButton.addTarget(self, action: #selector(tappedPointB), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(tappedClear), for: .touchUpInside)
    }
}
