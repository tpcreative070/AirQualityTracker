//
//  AirQualityServiceImp.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class AirQualityServiceImpl : AirQualityService {
    
    var clientService : ClientService!
    init(client : ClientService) {
        self.clientService = client
    }
    
    func fetchingData(lat : String, lon : String,completion: @escaping (AirqualityModel?, Error?) -> Void) {
        self.clientService.fetchingAirQualityData(lat: lat, lon: lon) {(data,error) in
            completion(data,error)
        }
    }
}

