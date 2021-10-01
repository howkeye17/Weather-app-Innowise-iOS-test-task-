//
//  DateFormatter.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 1.10.21.
//

import Foundation

extension DateFormatter {
    
    enum ForecastDateFormat: String {
        case weekdayDate = "EEEE, dd MMM"
        case currentTime = "HH:mm"
    }
    
    func getDateWith(dateFormat: ForecastDateFormat, date: String) -> String {
        self.dateFormat = "YYYY-MM-dd HH:mm:ss"
        guard let weekdayDate = self.date(from: date) else { return "no data"}
        self.dateFormat = dateFormat.rawValue
        let value = self.string(from: weekdayDate)
        return value
    }
}
