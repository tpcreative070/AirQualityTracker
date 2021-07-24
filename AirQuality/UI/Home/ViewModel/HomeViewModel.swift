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
    private var coordinateService : CoordinateService?
    init(service : CoordinateService) {
        self.coordinateService = service
        super.init()
        self.initObserver()
    }
    
  
    func handleReset() {
        actions = [:]
        onChangedLat?("")
        onChangedLon?("")
    }
    
    func addAction(action: EnumType) {
        actions[action.hashValue] = action.hashValue
    }
    
    private func initObserver() {
        coordinateService?.onObjectLat.subscribe(onNext : { [weak self] data in
            self?.onChangedLat?(data ?? "")
        }).disposed(by: disbag)
        coordinateService?.onObjectLon.subscribe(onNext : { [weak self] data in
            self?.onChangedLon?(data ?? "")
        }).disposed(by: disbag)
    }
}
