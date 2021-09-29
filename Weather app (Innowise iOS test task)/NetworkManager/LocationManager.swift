//
//  LocationManager.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 29.09.21.
//

import CoreLocation
import Foundation

protocol LocationManagerProtocol {
    func getCurrrentLocation(completionHandler: @escaping ((CLLocation) -> Void))
}

class LocationManager: NSObject, LocationManagerProtocol {
    
    private let locationManager = CLLocationManager()
    private var completion: ((CLLocation) -> Void)?
    
    func getCurrrentLocation(completionHandler: @escaping ((CLLocation) -> Void)) {
        self.completion = completionHandler
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
//        let latitude = location.coordinate.latitude
//        let longitude = location.coordinate.longitude
        
        self.completion?(location)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        self.locationManager.stopUpdatingLocation()
    }
    
}
