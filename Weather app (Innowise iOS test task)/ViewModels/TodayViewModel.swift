//
//  TodayViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//

import Foundation


class TodayViewModel: NSObject {
    
    var networkManager = NetworkWeatherManager()

    func fetchWeatheAndUpdateInterface() {
        networkManager.getWeatherData(forRequestType: .today) { weather in
            print(weather)
        }
    }
    
}

