//
//  Button+Extension.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import UIKit
extension UIButton {
    func makeCorner(_ colorName : CGColor){
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = colorName
    }
}
