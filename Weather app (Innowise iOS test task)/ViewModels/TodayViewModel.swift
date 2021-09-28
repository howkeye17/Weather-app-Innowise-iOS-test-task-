//
//  TodayViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//

import Foundation
import CoreLocation

class TodayViewModel: NSObject {
    
    private var todayWeather: TodayWeather?
    var networkManager = NetworkWeatherManager()
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        lm.startUpdatingLocation()
        return lm
    }()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
//    func updateInterface(withWeather weather: TodayWeather, completion: @escaping () -> ()) {
       
//        DispatchQueue.main.async {
//            print(weather)
//        }
//    }
    
    func fetchWeather(completion: @escaping () -> ()) {
        networkManager.todayCompletion = { [weak self] weather in
            guard let self = self else { return }
            self.todayWeather = weather
            print(self.todayWeather!)
        }
    }
    
}



extension TodayViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkManager.makeWeatherRequest(forRequestType: .today, forCoordinatesLatitude: latitude, longitude: longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
