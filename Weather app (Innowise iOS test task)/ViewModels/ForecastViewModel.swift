//
//  ForecastViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
protocol ForecastViewModelProtocol {
    func fetchWeatherForecast()
}


import Foundation
class ForecastViewModel: NSObject, ForecastViewModelProtocol {
   
    private let networkManager = NetworkWeatherManager()
    
    func fetchWeatherForecast() {
        networkManager.getForecastWeatherData(forRequestType: .forecast) { forecastData in
            guard let forecast = forecastData.todayWeatherData, let city = forecastData.city else { return }
            
            let mappedForecast = forecast.compactMap { ForecastWeather(forecastWeatherData: $0) }
            //            print(forecast)
            print(city)
            print("--------")
            print(mappedForecast)
        }
    }
    
}
