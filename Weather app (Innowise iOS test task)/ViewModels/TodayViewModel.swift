//
//  TodayViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//

protocol TodayViewModelProtocol {
    func fetchWeatherAndUpdateInterface()
}

import Foundation


class TodayViewModel: NSObject, TodayViewModelProtocol {
    

    private let networkManager = NetworkWeatherManager()

    func fetchWeatherAndUpdateInterface() {
        networkManager.getTodayWeatherData(forRequestType: .today) { weather in
            print(weather)
        }
    }
    
}

