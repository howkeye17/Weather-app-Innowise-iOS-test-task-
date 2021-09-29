//
//  ForecastViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
protocol ForecastViewModelProtocol {
    func fetchForecastAndUpdateInterface()
}


import Foundation
class ForecastViewModel: NSObject, ForecastViewModelProtocol {
   
    private let networkManager = NetworkWeatherManager()
    
    func fetchForecastAndUpdateInterface() {
        networkManager.getForecastWeatherData(forRequestType: .forecast) { forecast in
            
            print(forecast)
        
        }
    }
    
}
