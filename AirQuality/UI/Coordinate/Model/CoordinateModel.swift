//
//  ShowMapModel.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
import ObjectMapper

struct CoordinateModel : Mappable {
    
    var localityInfo : LocalityInfoObjectModel?
    var airQuality : AirqualityModel?
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.localityInfo <- map["localityInfo"]
    }
}

struct LocalityInfoObjectModel : Mappable {
    var administrative : [LocalityInfoModel] = [LocalityInfoModel]()
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        administrative  <- map["administrative"]
    }
}

class LocalityInfoModel : Mappable {
    var order : Int = 0
    var adminLevel : Int = 0
    var name : String = ""
    var description : String = ""
    var isoName : String = ""
    var isoCode : String = ""
    var wikidataId : String = ""
    var geonameId : String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        order <- map["order"]
        adminLevel <- map["adminLevel"]
        name <- map["name"]
        description <- map["description"]
        isoName <- map["isoName"]
        isoCode <- map["isoCode"]
        wikidataId <- map["wikidataId"]
        geonameId <- map["geonameId"]
    }
}
