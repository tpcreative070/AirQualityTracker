//
//  Protocol.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation
import RxSwift
import UIKit

protocol CoordinateService {
    var onObjectPointA : Observable<String?> {get}
    var onObjectPointB : Observable<String?> {get}
    func sendPointA(value : String)
    func sendPointB(value : String)
    func fetchingData(lat : String, lon : String,completion : @escaping (CoordinateModel?, Error?) -> Void)
}

protocol AirQualityService {
    func fetchingData(lat : String,lon : String,completion : @escaping (AirqualityModel?, Error?) -> Void)
}

protocol ClientService {
    func fetchingAirQualityData(lat : String,lon : String,completion : @escaping (AirqualityModel?, Error?) -> Void)
    func fetchingCoordinateData(lat : String, lon : String,completion : @escaping (CoordinateModel?, Error?) -> Void)
}


protocol CoordinateViewModelProtocol {
    var coordinateHistory: CoordinateHistoryViewModel {get set}
    func fetchingCoordinateData(lat : String, lon : String)
    func setLocation(lat : String, lon : String)
    func handleSendCoordinate()
    func initilizedUI()
    var onInitializedMap : ((Double,Double) ->())? {get}
    var onDone : (()->())? {get}
    var onNavigator : ((CoordinateHistoryViewModel?,CoordinateHistoryViewModel?) ->())? {get}
    func setRequestType(type : EnumType,actions : [Int:Int])
    var actions : [Int:Int] {get set}
    var onChanged : ((String,String)->())? {get}
    var onError : ((String)->())? {get}
    var onLoading : ((Bool)->())? {get}
}

protocol HomeViewModelProtocol {
    var onChangedPointA : ((String) -> ())? {get}
    var onChangedPointB : ((String) -> ())? {get}
    var actions : [Int:Int] {get set}
    func addAction(action : EnumType)
    func handleReset()
}

protocol CoordinateHistoryViewModelProtocol {
    var addressView : String {get}
    var airQualityView : String {get}
    var latView : String {get}
    var lonView : String {get}
    var pointView : String {get}
    var coordinateView : String {get}
    var createdDateTimeView : String {get}
    var latOrginal : String {get}
    var lonOriginal : String {get}
}

protocol AirQualityViewModelProtocol {
    var onPointA : ((String)->())? {get}
    var onPointB : ((String) -> ())? {get}
    var onPointAAddress : ((String) -> ())? {get}
    var onPointAAirQuality : ((String) -> ())? {get}
    var onPointBAddress : ((String) -> ())? {get}
    var onPointBAirQuality : ((String) -> ())? {get}
    func handleDisplayData()
}

protocol CoordinateHistoryVCViewModelProtocol {
    var data : [CoordinateHistoryViewModel] {get set}
    var onNavigator : ((CoordinateHistoryViewModel) ->())? {get}
}

protocol TableViewCellDelegate : AnyObject{
    func viewSelected(cell: CoordinateHistoryTableViewCell)
}
