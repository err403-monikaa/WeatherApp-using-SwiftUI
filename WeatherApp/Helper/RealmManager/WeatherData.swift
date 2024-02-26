//
//  WeatherData.swift
//  Weather
//
//  Created by Monikaa on 25/02/24.
//

import Foundation
import RealmSwift

class WeatherData: Object {
    @objc dynamic var id = 1
    @objc dynamic var currentTemperature: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var dailyTemperatureUnit: String = ""
    let date = List<String>()
    let dailyTemperature = List<Double>()
}
