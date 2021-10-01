//
//  ForecastViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//MARK: - ViewModelProtocol
protocol ForecastViewModelProtocol {
    func fetchWeatherForecast()
}


import Foundation
class ForecastViewModel: NSObject, ForecastViewModelProtocol {
//MARK: - ForecastViewModel propertyes
    private let networkManager = NetworkWeatherManager()
    private var cityName = ""
    private var sortedForecast: [[ForecastWeather]] = []
    
    func fetchWeatherForecast() {
        networkManager.getForecastWeatherData(forRequestType: .forecast) { forecastData in
            guard let forecast = forecastData.todayWeatherData, let city = forecastData.city else { return }
            self.prepareAllData(withForecast: forecast, city: city)
            
        }
    }
    
    private func prepareAllData(withForecast forecast: [TodayWeatherData], city: City) {
        guard let forecastCity = city.name else { return }
        self.cityName = forecastCity
        let forecastWeather = forecast.compactMap { ForecastWeather(forecastWeatherData: $0) }
        self.sortedForecast = self.forecastByDays(forecasts: forecastWeather)
    }
    
    private func forecastByDays(forecasts: [ForecastWeather]) -> [[ForecastWeather]] {
        return forecasts
            .reduce(into: [:]) { dictionary, forecast in
                dictionary[forecast.weekday, default: []] += [forecast] }
            .sorted(by: { firstElement, secondElement in
                let first = firstElement.1[0]
                let second = secondElement.1[0]
                return first.unixTime < second.unixTime })
            .compactMap { $1 }
            }
    
}
