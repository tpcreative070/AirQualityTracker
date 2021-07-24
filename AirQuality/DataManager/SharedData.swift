//
//  SharedData.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
class SharedData {
    static let instance : SharedData = SharedData()
    private var data : [CoordinateHistoryViewModel?] = []
    init() {
        
    }
    
    func add(vm : CoordinateHistoryViewModel?){
        data.append(vm)
    }
    
    func getData() -> [CoordinateHistoryViewModel]{
        return data.compactMap({$0})
    }
}
