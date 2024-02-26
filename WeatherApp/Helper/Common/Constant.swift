//
//  Constant.swift
//  Weather
//
//  Created by Monikaa on 25/02/24.
//

import Foundation

enum Constant {
    static let forcastTitle = "7-Days Forecast"
    static let statusUnknown = "unknown"
    static let statusNotDetermined = "notDetermined"
    static let statusAuthorizedWhenInUse = "authorizedWhenInUse"
    static let statusAuthorizedAlways = "authorizedAlways"
    static let statusRestricted = "restricted"
    static let statusDenied = "denied"
}

enum ApiConstant {
    static let baseApiURL = "https://api.open-meteo.com/v1/forecast?&forecast_days=16"
    static let baseApiEndPoint = "&current=temperature_2m&daily=temperature_2m_min&timezone=auto&forecast_days=7"
}

enum ImageConstant {
    static let dayIcon = "ic-clear-day"
    static let nightIcon = "ic-clear-night"
}
