//
//  TodayViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
import Foundation

class TodayViewModel {
    
//MARK: - Properties for TodayViewModel
    private let networkManager = NetworkWeatherManager()
    
//MARK: - Properties for TodayVC
    var cityName = ""
    var temperature = ""
    var weatherStatus = ""
    var weatherIcon = ""
    var humidity = ""
    var precipitation = ""
    var pressure = ""
    var windSpeed = ""
    var windDirection = ""
    var weatherLabel = ""
    
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

