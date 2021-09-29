//
//  ForecastWeather.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//

import Foundation

struct ForecastWeather {
    let cityName: String?
    let date: String?
    let statusOfWeather: String?
    
    let condition: Int?
    var forecastConditionCode: Int {
        guard let conditionCode = condition else { return 0}
        return conditionCode
    }
    var systemIconNameString: String {
        switch forecastConditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.max"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    let forecastTemperature: Double?
    var temperatureString: String {
        guard let temp = forecastTemperature else { return "no data"}
        return String(format: "%.0f", temp)
    }
    
    init?(forecastWeatherData: ForecastWeatherData) {
        cityName = forecastWeatherData.city?.name
        date = forecastWeatherData.todayWeatherData?.first!.dateText
        statusOfWeather = forecastWeatherData.todayWeatherData?.first!.weather?.first!.status
        condition = forecastWeatherData.todayWeatherData?.first!.weather?.first!.id
        forecastTemperature = forecastWeatherData.todayWeatherData?.first!.main?.temp
    }
}
