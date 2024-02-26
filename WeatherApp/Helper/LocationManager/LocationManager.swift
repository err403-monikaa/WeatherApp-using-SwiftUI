//
//  LocationManager.swift
//  Weather
//
//  Created by Monikaa on 25/02/24.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    var coordinates:  CLLocationCoordinate2D?
    
    @State var isLocationFetched = false
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return Constant.statusUnknown
        }
        switch status {
        case .notDetermined: return Constant.statusNotDetermined
        case .authorizedWhenInUse: return Constant.statusAuthorizedWhenInUse
        case .authorizedAlways: return Constant.statusAuthorizedAlways
        case .restricted: return Constant.statusRestricted
        case .denied: return Constant.statusDenied
        default: return Constant.statusUnknown
        }
    }
}
