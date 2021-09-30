//
//  TodayWeather.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 27.09.21.
//

import Foundation

struct TodayWeather {

    let cityName: String?
    var currentCity: String {
        guard let city = cityName else { return "no data" }
        return city
    }
    
    let temperature: Double?
    var temperatureString: String {
        guard let temperature = temperature else { return "no data"}
        return String(format: "%.0f", temperature)
    }
    
    let weatherStatus: String?
    var todayWeatherStatus: String {
        guard let status = weatherStatus else { return "no data" }
        return status
    }
    
    let todayConditionCode: Int?
    var conditionCode: Int {
        guard let conditionCode = todayConditionCode else { return 0}
        return conditionCode
    }
    var systemIconNameString: String {
        switch conditionCode {
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
    
    let humidity: Int?
    var todayHumidity: String {
        guard let todayHumidity = humidity else { return "no data"}
        return "\(todayHumidity)"
    }
    let rainAmount: Double?
    var precipitationAmount: String {
        guard let precipitation = rainAmount else { return "0.0" }
        return "\(precipitation)"
    }
    let pressure: Int?
    var todayPressure: String {
        guard let pressure = pressure else { return "no data" }
        return "\(pressure)"
    }
    
    let windSpeed: Double?
    var windKmH: String {
        guard let windSpeed = windSpeed else { return "no data" }
        return "\((Int(windSpeed) * 3600) / 1000)"
    }
    let direction: Int?
    var windDirection: Int {
        guard let direction = direction else { return 361 }
        return direction
    }
    var compassDirection: String {
        switch windDirection {
        case 0...22, 339...359: return "N"
        case 23...67: return "NE"
        case 68...112: return "E"
        case 113...157: return "SE"
        case 158...202: return "S"
        case 203...248: return "SW"
        case 249...294: return "W"
        case 295...338: return "NW"
        default: return "no data"
        }
    }
    
    init?(todayWeatherData: TodayWeatherData) {
        cityName = todayWeatherData.name
        temperature = todayWeatherData.main?.temp
        weatherStatus = todayWeatherData.weather?.first!.status
        todayConditionCode = todayWeatherData.weather?.first!.id
        humidity = todayWeatherData.main?.humidity
        rainAmount = todayWeatherData.rain?.rain ?? 0.0
        pressure = todayWeatherData.main?.pressure
        windSpeed = todayWeatherData.wind?.speed
        direction = todayWeatherData.wind?.direction
    }
}
