//
//  CoordinateHistoryViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation

class CoordinateHistoryViewModel : CoordinateHistoryViewModelProtocol {
    
    var pointView: String {
        let mValue = "Lat: \(lat?.prefix(10) ?? "null") : Lon: \(lon?.prefix(10) ?? "null")"
        return mValue
    }
    
    var latView: String {
        return "Lat: \(lat ?? "null")"
    }
    
    var lonView: String {
        return "Lon: \(lon ?? "null")"
    }
    
    var coordinateView: String {
        return "Lat: \(lat ?? "null") ; Lon \(lon ?? "null")"
    }
   
    var addressView: String {
        return "Address: \(address ?? "null")"
    }
    
    var airQualityView: String {
        return "Aqi: \(airQuality ?? "null")"
    }
    
    var createdDateTimeView: String {
        return createdDateTime ?? ""
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
    private var createdDateTime : String?
    init(address : String,airQuality : String, lat : String, lon : String) {
        self.lat = lat.prefix(10).description
        self.lon = lon.prefix(10).description
        self.createdDateTime = getCurrentDateTime()
        self.address = address
        self.airQuality = airQuality
    }
    
    init() {
        
    }
    
    private func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let datetime = formatter.string(from: Date())
        return datetime
    }
}
