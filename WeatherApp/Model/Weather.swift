//
//  Weather.swift
//  Weather
//
//  Created by Monikaa on 24/02/24.
//

import Foundation

//MARK: Weather
struct Weather: Codable {
    var latitude: Double?
    var longitude: Double?
    var generationtimeMS: Double?
    var utcOffsetSeconds: Int?
    var timezone: String?
    var timezoneAbbreviation: String?
    var elevation: Int?
    var currentUnits: CurrentUnits?
    var current: Current?
    var dailyUnits: DailyUnits?
    var daily: Daily?
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentUnits = "current_units"
        case current
        case dailyUnits = "daily_units"
        case daily
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.generationtimeMS = try container.decodeIfPresent(Double.self, forKey: .generationtimeMS)
        self.utcOffsetSeconds = try container.decodeIfPresent(Int.self, forKey: .utcOffsetSeconds)
        self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decodeIfPresent(String.self, forKey: .timezoneAbbreviation)
        self.elevation = try container.decodeIfPresent(Int.self, forKey: .elevation)
        self.currentUnits = try container.decodeIfPresent(CurrentUnits.self, forKey: .currentUnits)
        self.current = try container.decodeIfPresent(Current.self, forKey: .current)
        self.dailyUnits = try container.decodeIfPresent(DailyUnits.self, forKey: .dailyUnits)
        self.daily = try container.decodeIfPresent(Daily.self, forKey: .daily)
    }
}

//MARK: Current
struct Current: Codable {
    var time: String?
    var interval: Int?
    var temperature2M: Double?
    
    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature2M = "temperature_2m"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decodeIfPresent(String.self, forKey: .time)
        self.interval = try container.decodeIfPresent(Int.self, forKey: .interval)
        self.temperature2M = try container.decodeIfPresent(Double.self, forKey: .temperature2M)
    }
}

//MARK: CurrentUnits
struct CurrentUnits: Codable {
    var time: String?
    var interval: String?
    var temperature2M: String?
    
    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature2M = "temperature_2m"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decodeIfPresent(String.self, forKey: .time)
        self.interval = try container.decodeIfPresent(String.self, forKey: .interval)
        self.temperature2M = try container.decodeIfPresent(String.self, forKey: .temperature2M)
    }
}

//MARK: Daily
struct Daily: Codable {
    var time: [String]?
    var temperature2MMin: [Double]?
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMin = "temperature_2m_min"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decodeIfPresent([String].self, forKey: .time)
        self.temperature2MMin = try container.decodeIfPresent([Double].self, forKey: .temperature2MMin)
    }
}

//MARK: DailyUnits
struct DailyUnits: Codable {
    var time: String?
    var temperature2MMin: String?
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMin = "temperature_2m_min"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decodeIfPresent(String.self, forKey: .time)
        self.temperature2MMin = try container.decodeIfPresent(String.self, forKey: .temperature2MMin)
    }
}
