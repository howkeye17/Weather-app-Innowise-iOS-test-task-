//
//  WeatherCellViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 2.10.21.
//
import Foundation
import UIKit
// MARK: - WeatherCellViewModel Protocol
protocol WeatherCellViewModelProtocol: AnyObject {
    var weatherImage: UIImage? { get }
    var currentTime: String { get }
    var weatherStatus: String { get }
    var temperature: String { get }
}
//MARK: - WeatherCellViewModel Class
class WeatheCellViewModel: WeatherCellViewModelProtocol {
//MARK: - WeatherCellViewModel properties
    private var weatherForecast: ForecastWeather
    
    var weatherImage: UIImage? {
        guard let image = UIImage(systemName: weatherForecast.systemIconNameString) else { return nil }
        return image
    }
    var currentTime: String {
        return weatherForecast.currentTime
    }
    var weatherStatus: String {
        return weatherForecast.weatherStatus
    }
    var temperature: String {
        return weatherForecast.temperatureString + " ºC"
    }
//MARK: - Initialisation
    init(weatherForecast: ForecastWeather) {
        self.weatherForecast = weatherForecast
    }
    
}
