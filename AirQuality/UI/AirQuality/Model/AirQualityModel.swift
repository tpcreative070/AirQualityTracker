//
//  AirQualityModel.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import ObjectMapper

class AirqualityModel : Mappable {
    var data  : AirqualityObjectModel?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}


class AirqualityObjectModel : Mappable {
    var aqi : Int?
    var idx : Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        aqi <- map["aqi"]
        idx <- map["idx"]
    }
}
