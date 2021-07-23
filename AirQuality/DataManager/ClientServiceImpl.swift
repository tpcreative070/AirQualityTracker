//
//  ClientService.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Alamofire
import AlamofireObjectMapper

class ClientServiceImpl  : ClientService{
    
    func fetchingAirQualityData(lat: String, lon: String, completion: @escaping (AirqualityModel?, Error?) -> Void) {
        let url = "https://api.waqi.info/feed/geo:\(lat);\(lon)/?token=34e17701568632d237e554c76a120d99a8dfff20"
        Alamofire
            .request(url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<AirqualityModel>) in
                switch response.result {
                case .success(let data):
                    completion(data,nil)
                case .failure( _):
                    completion(nil,response.error)
                }
            })
    }
    
    func fetchingCoordinateData(lat: String, lon: String, completion: @escaping (CoordinateModel?, Error?) -> Void) {
        let url = "https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=\(lat)&longitude=\(lon)&localityLanguage=en"
        Alamofire
            .request(url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<CoordinateModel>) in
                switch response.result {
                case .success(let data):
                    completion(data,nil)
                case .failure( _):
                    completion(nil,response.error)
                }
            })
    }
}
