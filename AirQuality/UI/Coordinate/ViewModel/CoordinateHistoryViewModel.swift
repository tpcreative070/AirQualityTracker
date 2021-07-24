//
//  CoordinateHistoryViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation

class CoordinateHistoryViewModel : CoordinateHistoryViewModelProtocol {
    
    var latView: String {
        return lat ?? "10.823370"
    }
    
    var lonView: String {
        return lon ?? "106.638580"
    }
    
    var addressView: String {
        return address ?? ""
    }
    
    var airQualityView: String {
        return airQuality ?? "0"
    }
    
    private var address : String?
    private var airQuality : String?
    private var lat : String?
    private var lon : String?
    init(address : String,airQuality : String, lat : String, lon : String) {
        self.lat = lat
        self.lon = lon
        self.address = address
        self.airQuality = airQuality
    }
    
    init() {
        
    }
}
