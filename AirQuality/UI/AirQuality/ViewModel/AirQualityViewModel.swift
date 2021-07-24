//
//  AirQualityViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
class AirQualityViewModel : AirQualityViewModelProtocol {
    var onLat: ((String) -> ())?
    
    var onLon: ((String) -> ())?
    
    var onAddress: ((String) -> ())?
    
    var onAirQuality: ((String) -> ())?
    
    private var coordinateHistorty : CoordinateHistoryViewModel?
  
    init(data : CoordinateHistoryViewModel) {
        self.coordinateHistorty = data
    }
    
    func handleDisplayData() {
        guard  let mData = coordinateHistorty else {
            return
        }
        onLat?(mData.latView)
        onLon?(mData.lonView)
        onAddress?(mData.addressView)
        onAirQuality?(mData.airQualityView)
    }
}
