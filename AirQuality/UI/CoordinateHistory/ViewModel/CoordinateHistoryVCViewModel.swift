//
//  CoordinateHistoryVCViewModel.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
class CoordinateHistoryVCViewModel : CoordinateHistoryVCViewModelProtocol{
    var data: [CoordinateHistoryViewModel] = []
    var onNavigator: ((CoordinateHistoryViewModel) -> ())?
    init() {
        data.append(contentsOf: SharedData.instance.getData().reversed())
    }
    
    func handleItem(position : Int){
        if data.count > position{
            onNavigator?(data[position])
        }
    }
}
