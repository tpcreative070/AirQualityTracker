//
//  CoordinateViewModel.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
class CoordinateViewModel : CoordinateViewModelProtocol {
    
    var onChanged: ((String) -> ())?
    var onError: ((String) -> ())?
    
    private var coordinateService : CoordinateService?
    init(service : CoordinateService) {
        self.coordinateService = service
    }
    
    func fetchingCoordinateData(lat: String, lon: String) {
        coordinateService?.fetchingData(lat: lat, lon: lon, completion: { [weak self] (data, error) in
            guard let mData = data else {
                self?.onError?(error.debugDescription)
                return
            }
            if let address = mData.localityInfo?.administrative {
                let name : String  = address.suffix(2).reduce("") { data1, data2 in
                    if data1.isEmpty{
                        return "\(data1) \(data2.name)"
                    }
                    return "\(data1), \(data2.name)"
                }
                self?.onChanged?(name)
            }
        })
    }
}
