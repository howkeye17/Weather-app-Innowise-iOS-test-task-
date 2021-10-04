//
//  ViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 4.10.21.
//

import Foundation
// MARK: - TodayViewModel Protocol
protocol TodayViewModelProtocol: AnyObject {
    var cityName: String { get }
    var weatherIcon: String { get }
    var humidity: String { get }
    var precipitation: String { get }
    var pressure: String { get }
    var windSpeed: String { get }
    var windDirection: String { get }
    var weatherCondition: String { get }
}
//MARK: - TodayViewModel Class
class TodayViewModel: TodayViewModelProtocol {
//MARK: - TodayViewModel properties
    private var todayWeather: TodayWeather
    var cityName: String {
        return todayWeather.currentCity
    }
    var weatherIcon: String {
        return todayWeather.systemIconNameString
    }
    var humidity: String {
        return todayWeather.todayHumidity
    }
    var precipitation: String {
        return todayWeather.precipitationAmount
    }
    var pressure: String {
        return todayWeather.todayPressure
    }
    var windSpeed: String {
        return todayWeather.windKmH
    }
    var windDirection: String {
        return todayWeather.compassDirection
    }
    var weatherCondition: String {
        return todayWeather.fullWeatherCondition
    }
//MARK: - Initialisation
    init(weather: TodayWeather) {
        self.todayWeather = weather
    }
}
