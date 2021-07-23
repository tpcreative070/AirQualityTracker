//
//  CoordinateImpl.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//
import Alamofire
import AlamofireObjectMapper
import RxSwift

class CoordinateServiceImpl : CoordinateService {
    
    var clientService : ClientService!
    init(client : ClientService) {
        self.clientService = client
    }
    
    private let onObjectLat : PublishSubject<String> = PublishSubject<String>()
    var objectLat: Observable<String> {
        return onObjectLat.asObserver()
    }
    
    private let onObjectLon : PublishSubject<String> = PublishSubject<String>()
    var objectLon: Observable<String> {
        return onObjectLon.asObserver()
    }
    
    func sendLat(value: String) {
        onObjectLat.onNext(value)
    }
    
    func sendLon(value: String) {
        onObjectLon.onNext(value)
    }

    func fetchingData(lat : String, lon : String,completion: @escaping (CoordinateModel?, Error?) -> Void) {
        self.clientService.fetchingCoordinateData(lat: lat, lon: lon) {(data,error) in
            completion(data,error)
        }
    }
}
