//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Monikaa on 24/02/24.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class WeatherViewModel: NSObject  {
    
    let webServiceManager = WebServiceManager()
    var weatherData: WeatherData?
    var locationManager = LocationManager()
    var coordinates:  CLLocationCoordinate2D?
    var realmManager = RealmManager()
    
    var cityName = ""
    
    override init() {
        super.init()
        self.locationManager.locationManager.delegate = self
    }
    
    func getWetherData() {
        let userLatitude = coordinates?.latitude ?? 0.0
        let userLongitude = coordinates?.longitude ?? 0.0
        let apiURL = ApiConstant.baseApiURL + "&latitude=\(userLatitude)" + "&longitude=\(userLongitude)" + ApiConstant.baseApiEndPoint
        webServiceManager.getRequestData(urlString: apiURL) { weather in
            Common.getLocationName(userLatitude: weather.latitude, userLongitude: weather.longitude) { [weak self] cityName in
                let cName = (cityName == nil ? weather.timezone ?? "" : cityName) ?? ""
                self?.realmManager.saveForecastData(weatherApiResponse: weather, cityName: cName)
                self?.weatherData = self?.realmManager.getForecastData()
            }
        }
    }
}

extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if coordinates?.latitude == manager.location?.coordinate.latitude {
            return
        }
        coordinates = manager.location?.coordinate
        getWetherData()
    }
}


