//
//  RealmManager.swift
//  Weather
//
//  Created by Monikaa on 25/02/24.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published var weatherData =  WeatherData()
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func saveForecastData(weatherApiResponse: Weather, cityName: String) {
        deleteForecastData()
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let weatherData = WeatherData()
                    weatherData.city = cityName
                    weatherData.currentTemperature = String(weatherApiResponse.current?.temperature2M ?? 0.0) + (weatherApiResponse.currentUnits?.temperature2M ?? "")
                    weatherData.dailyTemperatureUnit = weatherApiResponse.dailyUnits?.temperature2MMin ?? ""
                    let temperature2MMin = weatherApiResponse.daily?.temperature2MMin ?? []
                    let date =  weatherApiResponse.daily?.time ?? []
                    weatherData.dailyTemperature.append(objectsIn: temperature2MMin)
                    weatherData.date.append(objectsIn: date)
                    localRealm.add(weatherData)
                }
            } catch {
                print("Error adding course to Realm", error)
            }
        }
    }
    
    func getForecastData() -> WeatherData  {
        if let localRealm = localRealm {
            let weatherDatafromlocal = localRealm.objects(WeatherData.self)
            return weatherDatafromlocal.first ?? WeatherData()
        }
        return WeatherData()
    }
    
    func deleteForecastData() {
        if let localRealm = localRealm {
            let allWeatherData = localRealm.objects(WeatherData.self)
            let weatherData = allWeatherData.filter("id == \(1)")
            guard !weatherData.isEmpty else { return }
            
            do {
                try localRealm.write {
                    localRealm.delete(weatherData)
                }
            } catch {
                print("Error deleting", error)
            }
            
        }
    }
}
