//
//  CoordinateHistoryViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation

class CoordinateHistoryViewModel : CoordinateHistoryViewModelProtocol {
    
    var latView: String {
        return "Lat: \(lat ?? "null")"
    }
    
    var lonView: String {
        return "Lon: \(lon ?? "null")"
    }
    
    var addressView: String {
        return "Address: \(address ?? "null")"
    }
    
    var airQualityView: String {
        return "Aqi: \(airQuality ?? "null")"
    }
    
    var latOrginal: String {
        return lat ?? "0"
    }
    
    var lonOriginal: String {
        return lon ?? "0"
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
