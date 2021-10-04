//
//  TodayViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
import Foundation
//MARK: Protocol for TodayViewModel
protocol TodayViewModelProtocol {
    var cityName: String { get }
    var temperature: String { get }
    var weatherStatus: String { get }
    var weatherIcon: String { get }
    var humidity: String { get }
    var precipitation: String { get }
    var pressure: String { get }
    var windSpeed: String { get }
    var windDirection: String { get }
    var weatherLabel: String { get }
    func fetchWeatherForToday(completion: @escaping ()-> ())
}

class TodayViewModel: NSObject, TodayViewModelProtocol {
//MARK: - Properties for TodayViewModel
    private let networkManager = NetworkWeatherManager()
//MARK: - Properties for TodayVC
    private(set) var cityName = ""
    private(set) var temperature = ""
    private(set) var weatherStatus = ""
    private(set) var weatherIcon = ""
    private(set) var humidity = ""
    private(set) var precipitation = ""
    private(set) var pressure = ""
    private(set) var windSpeed = ""
    private(set) var windDirection = ""
    private(set) var weatherLabel = ""
    
//MARK: - TodayViewModel methods
    
    func fetchWeatherForToday(completion: @escaping ()-> ()) {
        networkManager.getTodayWeatherData(forRequestType: .today) { weather in
            self.setParameters(withTodayWeather: weather)
            completion()
        }
    }
    
    private func setParameters(withTodayWeather weather: TodayWeather) {
        self.cityName = weather.currentCity
        self.temperature = weather.temperatureString
        self.weatherStatus = weather.todayWeatherStatus
        self.weatherIcon = weather.systemIconNameString
        self.humidity = weather.todayHumidity + "%"
        self.precipitation = weather.precipitationAmount + " mm"
        self.pressure = weather.todayPressure + " hPA"
        self.windSpeed = weather.windKmH + " km/h"
        self.windDirection = weather.compassDirection
        self.weatherLabel = self.temperature + "ºC  |  " + self.weatherStatus
    }
    
}

