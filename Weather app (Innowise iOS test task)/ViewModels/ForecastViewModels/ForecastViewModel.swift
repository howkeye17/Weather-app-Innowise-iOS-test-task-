//
//  ForecastViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
import Foundation
//MARK: - Protocol for ForecastViewModel
protocol ForecastViewModelProtocol {
    func fetchWeatherForecast(completion: @escaping ()-> ())
    func headerViewModel(inSection section: Int) -> HeaderCellViewModelProtocol?
    func cellViewModel(forIndexPath indexPath: IndexPath) -> WeatherCellViewModelProtocol?
    func numbersOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func titleForForecastVC() -> String
}

class ForecastViewModel: NSObject, ForecastViewModelProtocol {
//MARK: - ForecastViewModel properties
    private let networkManager = NetworkWeatherManager()
    private var cityName = ""
    private var sortedForecast: [[ForecastWeather]] = []
    
//MARK: - ForecastViewModel methods for fetching and preparing data
    func fetchWeatherForecast(completion: @escaping ()-> ()) {
        networkManager.getForecastWeatherData(forRequestType: .forecast) { forecastData in
            guard let forecast = forecastData.todayWeatherData, let city = forecastData.city else { return }
            self.prepareAllData(withForecast: forecast, city: city)
            completion()
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
    
//MARK: - ForecastViewModel methods for updating UI
    func headerViewModel(inSection section: Int) -> HeaderCellViewModelProtocol? {
        return HeaderCellViewModel(weatherForecast: sortedForecast, section: section)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> WeatherCellViewModelProtocol? {
        let weatherForecast = sortedForecast[indexPath.section][indexPath.row]
        return WeatheCellViewModel(weatherForecast: weatherForecast)
    }
    
    func numbersOfSections() -> Int {
        return sortedForecast.count
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return sortedForecast[section].count
    }
    
    func titleForForecastVC() -> String {
        return cityName
    }
    
}
