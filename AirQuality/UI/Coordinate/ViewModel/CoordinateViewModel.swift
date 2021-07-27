//
//  CoordinateViewModel.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
class CoordinateViewModel : BaseViewModel , CoordinateViewModelProtocol{
    
    var onChanged: ((String,String) -> ())?
    var onError: ((String) -> ())?
    var onDone: (() -> ())?
    var onLoading: ((Bool) -> ())?
    var onInitializedMap: ((Double, Double) -> ())?
    var onNavigator: ((CoordinateHistoryViewModel?, CoordinateHistoryViewModel?) -> ())?
    var actions: [Int : Int] = [:]
    private var requestType : EnumType = .POINT_A
    private var lat : String = "10.823370", lon : String = "106.638580"
    var coordinateHistory: CoordinateHistoryViewModel = CoordinateHistoryViewModel()
    private var coordinateService : CoordinateService?
    private var airQualityService  : AirQualityService?
    private var pointA : String?, pointB : String?
    init(_ coordinateService : CoordinateService,_ airQualityService : AirQualityService) {
        self.coordinateService = coordinateService
        self.airQualityService = airQualityService
    }
    
    func setRequestType(type: EnumType,actions : [Int:Int]) {
        self.requestType = type
        self.actions = actions
    }
    
    func setLocation(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
    
    func initilizedUI() {
        onInitializedMap?(Double(lat) ?? 0,Double(lon) ?? 0)
    }
    
    func fetchingCoordinateData(lat: String, lon: String) {
        self.onLoading?(true)
        coordinateService?.fetchingData(lat: lat, lon: lon, completion: { [weak self] (data, error) in
            self?.airQualityService?.fetchingData(lat: lat, lon: lon, completion: { [weak self] airQualityData, airQualityError in
                guard let mData = data, let mDataAirQuality = airQualityData?.data else {
                    self?.onError?(error.debugDescription)
                    return
                }
                if let address = mData.localityInfo?.administrative{
                    let name : String  = address.suffix(2).reduce("") { data1, data2 in
                        if data1.isEmpty{
                            return "\(data1)\(data2.name)"
                        }
                        return "\(data1), \(data2.name)"
                    }
                    let airQuality = "\(mDataAirQuality.aqi ?? 0)"
                    self?.coordinateHistory = CoordinateHistoryViewModel(address: name, airQuality: airQuality, lat: lat, lon: lon)
                    SharedData.instance.add(vm: self?.coordinateHistory)
                    self?.onChanged?(name,airQuality)
                    if self?.requestType  == .POINT_A {
                        SharedPoint.instance.pointA = self?.coordinateHistory
                    }
                    if self?.requestType == .POINT_B {
                        SharedPoint.instance.pointB = self?.coordinateHistory
                    }
                }
                self?.onLoading?(false)
            })
        })
    }
    
    func handleSendCoordinate() {
        if requestType == .POINT_A{
            guard let _ = SharedPoint.instance.pointA else {
                fetchingCoordinateData(lat: lat, lon: lon)
                return
            }
            let mValue = "{ Lat: \(String(lat.prefix(10))) : Lon: \(String(lon.prefix(10))) }"
            self.pointA = mValue
            coordinateService?.sendPointA(value: mValue)
        }else{
            guard let _ = SharedPoint.instance.pointB else {
                fetchingCoordinateData(lat: lat, lon: lon)
                return
            }
            let mValue = "{ Lat: \(String(lat.prefix(10))) : Lon: \(String(lon.prefix(10))) }"
            self.pointB = mValue
            coordinateService?.sendPointB(value: mValue)
        }
        if actions.count>1{
            onNavigator?(SharedPoint.instance.pointA,SharedPoint.instance.pointB)
        }else{
            onDone?()
        }
    }
}
