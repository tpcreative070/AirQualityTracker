//
//  Dependencies.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
class Dependencies {
    static var instance : Dependencies = Dependencies()
    
    static var coordinateService : CoordinateService = instance.internalCoordinateService
    static var clientService : ClientService = instance.internalClientService
    
        
    private lazy var internalClientService : ClientService = {
        return ClientServiceImpl()
    }()
    
    private lazy var  internalCoordinateService : CoordinateService = {
        return CoordinateServiceImpl(client: internalClientService)
    }()
    
    private lazy var internalAirQuality : AirQualityService = {
       return AirQualityServiceImpl(client: internalClientService)
    }()
    
    private init() {
        
    }
}
