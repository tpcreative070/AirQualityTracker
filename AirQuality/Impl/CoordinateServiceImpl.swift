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
    
    private let pointAObservable : BehaviorSubject<String?> = BehaviorSubject<String?>(value: nil)
    var onObjectPointA: Observable<String?> {
        return pointAObservable.asObserver()
    }
    
    private let pointBObservable : BehaviorSubject<String?> = BehaviorSubject<String?>(value: nil)
    var onObjectPointB: Observable<String?> {
        return pointBObservable.asObserver()
    }
    
    func sendPointA(value: String) {
        pointAObservable.onNext(value)
    }
    
    func sendPointB(value: String) {
        pointBObservable.onNext(value)
    }

    func fetchingData(lat : String, lon : String,completion: @escaping (CoordinateModel?, Error?) -> Void) {
        self.clientService.fetchingCoordinateData(lat: lat, lon: lon) {(data,error) in
            completion(data,error)
        }
    }
}
