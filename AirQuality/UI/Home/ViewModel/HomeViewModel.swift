//
//  HomeViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
import RxSwift

class HomeViewModel : BaseViewModel, HomeViewModelProtocol {
    
    var onChangedLat: ((String) -> ())?
    var onChangedLon: ((String) -> ())?
    var actions: [Int : Int] = [:]
    private var lat : String?
    private var lon : String?
    private var coordinateService : CoordinateService?
    init(service : CoordinateService) {
        self.coordinateService = service
        super.init()
        self.initObserver()
    }
    
    func handleReset() {
        actions = [:]
        lat = nil
        lon = nil
        onChangedLat?("")
        onChangedLon?("")
    }
    
    func addAction(action: EnumType) {
        if action == EnumType.LAT {
            if lon == nil {
                actions.removeValue(forKey: EnumType.LON.hashValue)
            }
        }
        if action == EnumType.LON {
            if lat == nil {
                actions.removeValue(forKey: EnumType.LAT.hashValue)
            }
        }
        actions[action.hashValue] = action.hashValue
    }
    
    private func initObserver() {
        coordinateService?.onObjectLat.subscribe(onNext : { [weak self] data in
            self?.lat = data
            self?.onChangedLat?(data ?? "")
        }).disposed(by: disbag)
        coordinateService?.onObjectLon.subscribe(onNext : { [weak self] data in
            self?.lon = data
            self?.onChangedLon?(data ?? "")
        }).disposed(by: disbag)
    }
}
