//
//  DateFormatter.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 1.10.21.
//

import Foundation
//MARK: - Extension for DateFormatter 
extension DateFormatter {
    
    enum ForecastDateFormat: String {
        case weekdayDate = "EEEE, dd MMMM"
        case currentTime = "HH:mm"
        case fullFormatDate = "YYYY-MM-dd HH:mm:ss"
    }
    
    func fullDate(dateFormat: ForecastDateFormat, date: String?) -> Date? {
        guard let date = date else { return nil }
        self.dateFormat = dateFormat.rawValue
        return self.date(from: date)
    }
    
    func getDateWith(dateFormat: ForecastDateFormat, date: Date?) -> String {
        guard let date = date else { return "No data" }
        self.dateFormat = dateFormat.rawValue
        let value = self.string(from: date)
        return value
    }
}
