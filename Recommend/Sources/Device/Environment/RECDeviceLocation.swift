//
//  RECDeviceLocation.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import CoreLocation

struct RECDeviceLocation: Encodable {
    let latitude: Double
    let longtitude: Double
    
    // MARK: Init
    
    public init(
        latitude: Double,
        longtitude: Double
    ) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
    
    public init(location: CLLocation) {
        self.init(latitude: location.coordinate.latitude,
                  longtitude: location.coordinate.longitude)
    }
}

extension RECDeviceLocation {
    static var `default`: RECDeviceLocation? {
        let manager = CLLocationManager()
        
        var authorizationStatus: CLAuthorizationStatus!
        if #available(iOS 14.0, *) {
            authorizationStatus = manager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        switch authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let location = manager.location else {
                return nil
            }
            return Self(location: location)
            
        default:
            return nil
        }
    }
}
