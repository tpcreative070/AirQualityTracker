//
//  Protocol.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
import RxSwift

protocol CoordinateService {
    var onObjectLat : Observable<String?> {get}
    var onObjectLon : Observable<String?> {get}
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
    func handleSendCoordinate()
    var onDone : (()->())? {get}
    var onNavigator : ((CoordinateHistoryViewModel) ->())? {get}
    func setRequestType(type : EnumType,actions : [Int:Int])
    var actions : [Int:Int] {get set}
    var onChanged : ((String,String)->())? {get}
    var onError : ((String)->())? {get}
}

protocol HomeViewModelProtocol {
    var onChangedLat : ((String) -> ())? {get}
    var onChangedLon : ((String) -> ())? {get}
    var actions : [Int:Int] {get set}
    func addAction(action : EnumType)
    func handleReset()
}

protocol CoordinateHistoryViewModelProtocol {
    var addressView : String {get}
    var airQualityView : String {get}
    var latView : String {get}
    var lonView : String {get}
}

protocol AirQualityViewModelProtocol {
    var onLat : ((String)->())? {get}
    var onLon : ((String) -> ())? {get}
    var onAddress : ((String) -> ())? {get}
    var onAirQuality : ((String) -> ())? {get}
    func handleDisplayData()
}
