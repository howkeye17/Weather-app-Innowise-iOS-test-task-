//
//  TodayWeatherData.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 27.09.21.
//

import Foundation

struct TodayWeatherData: Codable {
    
    let name: String  // cityName
    let main: Main
    let wind: Wind
    let rain: Rain
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

struct Rain: Codable {
    let rain: Double?  // rain amoun for the last 1h

    enum CodingKeys: String, CodingKey {
        case rain = "1h"
    }
}

struct Weather: Codable {
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
