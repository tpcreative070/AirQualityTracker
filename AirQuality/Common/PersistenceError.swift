//
//  PersistenceError.swift
//  AirQuality
//
//  Created by phong070 on 23/07/2021.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
