//
//  TodayViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 28.09.21.
//
import Foundation
//MARK: Protocol for TodayViewControllerViewModel
protocol TodayViewControllerViewModelProtocol {
    func fetchTodayWeather(completion: @escaping (TodayWeather)-> ())
}

class TodayViewControllerViewModel: NSObject, TodayViewControllerViewModelProtocol {
//MARK: - Properties for TodayViewControllerViewModel
    private let networkManager = NetworkWeatherManager()
    
//MARK: - TodayViewControllerViewModel methods
        
    func fetchTodayWeather(completion: @escaping (TodayWeather)-> ()) {
        networkManager.getTodayWeatherData(forRequestType: .today) { weather in
            completion(weather)
        }
    }
    
}

