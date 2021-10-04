//
//  ForecastWeather.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
import Foundation
//MARK: - ForecastWeather Strcut for initialisation of all properties
struct ForecastWeather {
//MARK: - Properties
    let date: String?
    
    var fullDate: Date? {
        let dateFormatter = DateFormatter()
        return dateFormatter.fullDate(dateFormat: .fullFormatDate, date: date)
    }
    var weekday: String {
        let dateFormatter = DateFormatter()
        return dateFormatter.getDateWith(dateFormat: .weekdayDate, date: fullDate)
    }
    var currentTime: String {
        let dateFormatter = DateFormatter()
        return dateFormatter.getDateWith(dateFormat: .currentTime, date: fullDate)
    }
    
    let statusOfWeather: String?
    var weatherStatus: String {
        guard let status = statusOfWeather else { return "no data" }
        return status
    }
    
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
        return String(format: "%.0f", temp) + " ºC"
    }
    
    let unix: Int?
    var unixTime: Int {
        guard let unixTime = unix else { return 0 }
        return unixTime
    }
//MARK: - Initialisation
    init?(forecastWeatherData: TodayWeatherData) {
        date = forecastWeatherData.dateText
        statusOfWeather = forecastWeatherData.weather?.first!.status
        condition = forecastWeatherData.weather?.first!.id
        forecastTemperature = forecastWeatherData.main?.temp
        unix = forecastWeatherData.unixTime
    }
}
