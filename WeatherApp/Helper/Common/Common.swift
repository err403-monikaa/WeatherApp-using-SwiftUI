//
//  Common.swift
//  Weather
//
//  Created by Monikaa on 25/02/24.
//

import Foundation
import CoreLocation

class Common {
    
    static func getDay(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return "" }
        formatter.dateFormat = "EEEE, MMM d"
        let day = formatter.string(from: date)
        return day
    }
    
    static func changeDateFormat(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return "" }
        formatter.dateFormat = "MMM d"
        let day = formatter.string(from: date)
        return day
    }
    
    static func getLocationName(userLatitude: Double?, userLongitude: Double?, completion: @escaping (String?) -> Void) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: userLatitude ?? 0, longitude: userLongitude ?? 0)
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            //Place Details
            guard let placemark = placemarks?.first else { return}
            //City
            if let city = placemark.subAdministrativeArea{
                completion(city)
            }else {
                completion(nil)
            }
        }
    }
}
