//
//  NetworkManager.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
import CoreLocation
import Foundation

class NetworkWeatherManager: NSObject {
    
    enum RequestType {
        case today
        case forecast
    }
    private var locationManager: LocationManagerProtocol?
    private let apiKey = "feb82fdae10fd78c3c736344c9a78e08"
    private var todayCompletion: ((TodayWeather) -> Void)?
    private var forecastCompletion: ((ForecastWeatherData) -> Void)?
    private var requestType: RequestType?
    
    override init() {
        super.init()
        locationManager = LocationManager()
    }
    
    func getTodayWeatherData(forRequestType requestType: RequestType, completion : @escaping ((TodayWeather) -> Void)) {
        self.requestType = requestType
        self.todayCompletion = completion
        locationManager?.getCurrrentLocation(completionHandler: { [weak self] location in
            guard let self = self else { return }
            self.makeWeatherRequest(forCoordinatesLatitude: location.coordinate.latitude,
                                    longitude: location.coordinate.longitude)
        })
    }
    
    func getForecastWeatherData(forRequestType requestType: RequestType, completion : @escaping ((ForecastWeatherData) -> Void)) {
        self.requestType = requestType
        self.forecastCompletion = completion
        locationManager?.getCurrrentLocation(completionHandler: { [weak self] location in
            guard let self = self else { return }
            self.makeWeatherRequest(forCoordinatesLatitude: location.coordinate.latitude,
                                    longitude: location.coordinate.longitude)
        })
    }
    
    private func makeWeatherRequest(forCoordinatesLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        var urlString = ""
        
        switch requestType {
        case .today: urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        case .forecast: urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        case .none: return
        }
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                let decoder = JSONDecoder()
                do {
                    switch self.requestType {
                    case .today:
                        let weatherData = try decoder.decode(TodayWeatherData.self, from: data)
                        guard let weather = TodayWeather(todayWeatherData: weatherData) else { return }
                        self.todayCompletion?(weather)
                    case .forecast: let weatherData = try decoder.decode(ForecastWeatherData.self, from: data)
                        self.forecastCompletion?(weatherData)
                    case .none: return
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            else {
                print(error!.localizedDescription)
            }
        }
        task.resume()
    }
    
}

