//
//  HomeViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
import RxSwift

class HomeViewModel : BaseViewModel, HomeViewModelProtocol {
    
    var onChangedPointA: ((String) -> ())?
    var onChangedPointB: ((String) -> ())?
    var actions: [Int : Int] = [:]
    private var pointA : String?
    private var pointB : String?
    private var coordinateService : CoordinateService?
    init(service : CoordinateService) {
        self.coordinateService = service
        super.init()
        self.initObserver()
    }
    
    func handleReset() {
        actions = [:]
        pointA = nil
        pointB = nil
        SharedPoint.instance.pointA = nil
        SharedPoint.instance.pointB = nil
        onChangedPointA?("")
        onChangedPointB?("")
    }
    
    func addAction(action: EnumType) {
        if action == EnumType.POINT_A {
            if pointB == nil {
                actions.removeValue(forKey: EnumType.POINT_B.hashValue)
            }
        }
        if action == EnumType.POINT_B {
            if pointA == nil {
                actions.removeValue(forKey: EnumType.POINT_A.hashValue)
            }
        }
        actions[action.hashValue] = action.hashValue
    }
    
    private func initObserver() {
        coordinateService?.onObjectPointA.subscribe(onNext : { [weak self] data in
            self?.pointA = data
            self?.onChangedPointA?("Point A \(data ?? "")")
        }).disposed(by: disbag)
        coordinateService?.onObjectPointB.subscribe(onNext : { [weak self] data in
            self?.pointB = data
            self?.onChangedPointB?("Point B \(data ?? "")")
        }).disposed(by: disbag)
    }
}
