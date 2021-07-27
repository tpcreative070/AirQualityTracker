//
//  SharedPoint.swift
//  AirQuality
//
//  Created by phong070 on 27/07/2021.
//

import Foundation
class SharedPoint {
    static let instance = SharedPoint()
    var pointA : CoordinateHistoryViewModel?
    var pointB : CoordinateHistoryViewModel?
    private init() {
    }
}
