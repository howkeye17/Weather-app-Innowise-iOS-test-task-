//
//  ForecastWeatherData.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//

import Foundation

struct ForecastWeatherData: Codable {
    let todayWeatherData: [TodayWeatherData]?
    let city: City?
    
    enum CodingKeys: String, CodingKey {
        case todayWeatherData = "list"
        case city
    }
}
struct City: Codable {
    let name: String
}

