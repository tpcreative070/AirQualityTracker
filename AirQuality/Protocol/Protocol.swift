//
//  Protocol.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
import RxSwift

protocol CoordinateService {
    var objectLat : Observable<String> {get}
    var objectLon : Observable<String> {get}
    func sendLat(value : String)
    func sendLon(value : String)
    func fetchingData(lat : String, lon : String,completion : @escaping (CoordinateModel?, Error?) -> Void)
}

protocol AirQualityService {
    func fetchingData(lat : String,lon : String,completion : @escaping (AirqualityModel?, Error?) -> Void)
}

protocol ClientService {
    func fetchingAirQualityData(lat : String,lon : String,completion : @escaping (AirqualityModel?, Error?) -> Void)
    func fetchingCoordinateData(lat : String, lon : String,completion : @escaping (CoordinateModel?, Error?) -> Void)
}


protocol CoordinateViewModelProtocol {
    func fetchingCoordinateData(lat : String, lon : String)
    var onChanged : ((String)->())? {get}
    var onError : ((String)->())? {get}
}

protocol AirQualityViewModelProtocol {
    
}
