//
//  HeaderCellViewModel.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 3.10.21.
//

import Foundation
//MARK: - HeaderCellViewModel Protocol
protocol HeaderCellViewModelProtocol: AnyObject {
    var headerLabelText: String { get }
}
//MARK: - HeaderCellViewModel Class
class HeaderCellViewModel: HeaderCellViewModelProtocol {
//MARK: - Properties for HeaderCellViewModel
    private var weatherForecast: [[ForecastWeather]]
    private var section: Int
    
    var headerLabelText: String {
        if section == 0 { return "Today"
        } else {
            return weatherForecast[section].first!.weekday
        }
    }
//MARK: - Initialisation
    init(weatherForecast: [[ForecastWeather]], section: Int) {
        self.weatherForecast = weatherForecast
        self.section = section
    }
}
