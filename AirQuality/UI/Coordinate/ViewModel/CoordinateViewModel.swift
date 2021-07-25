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
    var onNavigator: ((CoordinateHistoryViewModel) -> ())?
    var actions: [Int : Int] = [:]
    private var requestType : EnumType = .LAT
    private var lat : String = "10.823370", lon : String = "106.638580"
    var coordinateHistory: CoordinateHistoryViewModel = CoordinateHistoryViewModel()
    private var coordinateService : CoordinateService?
    private var airQualityService  : AirQualityService?
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
            self?.airQualityService?.fetchingData(lat: lat, lon: lon, completion: { airQualityData, airQualityError in
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
                }
                self?.onLoading?(false)
            })
        })
    }
    
    func handleSendCoordinate() {
        if requestType == .LAT{
            coordinateService?.sendLat(value: lat)
        }else{
            coordinateService?.sendLon(value: lon)
        }
        if actions.count>1 {
            onNavigator?(coordinateHistory)
        }else{
            onDone?()
        }
    }
}
