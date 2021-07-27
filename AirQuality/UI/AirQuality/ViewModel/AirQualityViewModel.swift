//
//  AirQualityViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
class AirQualityViewModel : AirQualityViewModelProtocol {
    var onPointA: ((String) -> ())?
    
    var onPointB: ((String) -> ())?
    
    var onPointAAddress: ((String) -> ())?
    
    var onPointAAirQuality: ((String) -> ())?
    
    var onPointBAddress: ((String) -> ())?
    
    var onPointBAirQuality: ((String) -> ())?
    
    private var pointA: CoordinateHistoryViewModel?
    private var pointB: CoordinateHistoryViewModel?
  
    init(pointA : CoordinateHistoryViewModel?, pointB : CoordinateHistoryViewModel?) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func handleDisplayData() {
        guard  let mPointA = pointA, let mPointB = pointB else {
            return
        }
        onPointA?(mPointA.pointView)
        onPointAAddress?(mPointA.addressView)
        onPointAAirQuality?(mPointA.airQualityView)
        
        onPointB?(mPointB.pointView)
        onPointBAddress?(mPointB.addressView)
        onPointBAirQuality?(mPointB.airQualityView)
    }
}
