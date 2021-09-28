//
//  NetworkManager.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
import CoreLocation
import Foundation


class NetworkWeatherManager {
    
    private let apiKey = "feb82fdae10fd78c3c736344c9a78e08"
    enum RequestType {
        case today
        case forecast
    }
    var todayCompletion: ((TodayWeather) -> Void)?
    var forecastCompletion: ((ForecastWeather) -> Void)?
    
    
    
    func makeWeatherRequest(forRequestType requestType: RequestType,
                            forCoordinatesLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        var urlString = ""
              
        switch requestType {
        case .today: urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        case .forecast: urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        }
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            
            if let data = data, error == nil {
                switch requestType {
                case .today: let todayResopse = self.todayWeatherData(withData: data);
                    if let todayResopse = todayResopse {
                        self.todayCompletion?(todayResopse)
                    }
                case .forecast: let forecastResopse = self.forecastWeatherData(withData: data);
                    if let forecastResopse = forecastResopse {
                        self.forecastCompletion?(forecastResopse)
                    }
                }
            }
            else {
                print(error!.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    private func todayWeatherData(withData data: Data) -> TodayWeather? {
        let decoder = JSONDecoder()
        do {
            let todayWeatherData = try decoder.decode(TodayWeatherData.self, from: data)
            guard let todayWeather = TodayWeather(todayWeatherData: todayWeatherData) else { return nil }
            return todayWeather
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
    
    private func forecastWeatherData(withData data: Data) -> ForecastWeather? {
       let decoder = JSONDecoder()
        do {
            let forecastWeatherData = try decoder.decode(ForecastWeatherData.self, from: data)
            guard let forecastWeather = ForecastWeather(forecastWeatherData: forecastWeatherData) else { return nil }
            return forecastWeather
        } catch let error as NSError {
            print(error)
        }
      return nil
    }
}


