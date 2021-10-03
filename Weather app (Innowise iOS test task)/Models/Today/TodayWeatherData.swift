//
//  TodayWeatherData.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 27.09.21.
//

import Foundation
//MARK: TodayWeatherData - struct for the response from API for Current weather
struct TodayWeatherData: Codable {
    let name: String?  // cityName
    let unixTime: Int?
    let main: Main?
    let wind: Wind?
    let rain: Rain?
    let weather: [WeatherElement]?
    let dateText: String?
    
    enum CodingKeys: String, CodingKey {
        case name, main, wind, rain, weather
        case unixTime = "dt"
        case dateText = "dt_txt"
    }
}
struct Main: Codable {
    let temp: Double? //temperature
    let pressure: Int?
    let humidity: Int?
}
struct Rain: Codable {
    let rain: Double?  // rain amoun for the last 3h
    let oneHourRain: Double?
    
    enum CodingKeys: String, CodingKey {
        case oneHourRain = "1h"
        case rain = "3h"
    }
}
struct WeatherElement: Codable {
    let id: Int   // conditionCode for weather status image
    let status: String // status(cloud, sun etc..)
    
    enum CodingKeys: String, CodingKey {
        case id
        case status = "main"
    }
}
struct Wind: Codable {
    let speed: Double // wind speed
    let direction: Int  // wind direction degrees (meteorological)
    
    enum CodingKeys: String, CodingKey {
        case speed
        case direction = "deg"
    }
}


