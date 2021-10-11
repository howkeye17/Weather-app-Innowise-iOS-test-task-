//
//  LocationManager.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 29.09.21.
//
//MARK: - LocationManager Protocol
protocol LocationManagerProtocol {
    func getCurrrentLocation(completionHandler: @escaping ((CLLocation) -> Void))
}
import CoreLocation
import Foundation
//MARK: - LocationManager Class
class LocationManager: NSObject, LocationManagerProtocol {
//MARK: - LocationManager properties
    private let locationManager = CLLocationManager()
    private var completion: ((CLLocation) -> Void)?
//MARK: - LocationManager methods
    func getCurrrentLocation(completionHandler: @escaping ((CLLocation) -> Void)) {
        self.completion = completionHandler
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}
//MARK: - Extension for LocationManager
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }        
        self.completion?(location)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong: \(error.localizedDescription)")
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.locationManager.startUpdatingLocation()
    }
    
}
