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
    
    private let latObservable : BehaviorSubject<String?> = BehaviorSubject<String?>(value: nil)
    var onObjectLat: Observable<String?> {
        return latObservable.asObserver()
    }
    
    private let lonObservable : BehaviorSubject<String?> = BehaviorSubject<String?>(value: nil)
    var onObjectLon: Observable<String?> {
        return lonObservable.asObserver()
    }
    
    func sendLat(value: String) {
        latObservable.onNext(value)
    }
    
    func sendLon(value: String) {
        lonObservable.onNext(value)
    }

    func fetchingData(lat : String, lon : String,completion: @escaping (CoordinateModel?, Error?) -> Void) {
        self.clientService.fetchingCoordinateData(lat: lat, lon: lon) {(data,error) in
            completion(data,error)
        }
    }
}
