//
//  CoordinateHistoryVC+ViewFactory.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import UIKit

extension CoordinateHistoryVC {
    
    func initUI(){
        setupConstraint()
        setupTableView()
    }
    
    private func setupConstraint(){
        self.view.addSubview(tableview)
        tableview.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            make.leading.top.trailing.bottom.equalTo(self.view)
        }
        
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
    }
    
    private func setupTableView(){
        tableview.register(CoordinateHistoryTableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.estimatedRowHeight = 200
        tableview.separatorStyle = .singleLine
    }
}
