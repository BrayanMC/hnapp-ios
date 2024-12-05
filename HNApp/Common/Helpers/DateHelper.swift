//
//  DateHelper.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import Foundation

struct DateHelper {
    
    static func timeElapsedSince(dateString: String) -> String? {
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        let now = Date()
        let elapsedTime = now.timeIntervalSince(date)
        
        let secondsInMinute = 60
        let secondsInHour = 3600
        let secondsInDay = 86400
        let secondsInYear = 31536000
        
        let years = Int(elapsedTime) / secondsInYear
        let days = (Int(elapsedTime) % secondsInYear) / secondsInDay
        let hours = (Int(elapsedTime) % secondsInDay) / secondsInHour
        let minutes = (Int(elapsedTime) % secondsInHour) / secondsInMinute
        let seconds = Int(elapsedTime) % secondsInMinute
        
        if years > 0 {
            return "\(years)y"
        } else if days > 1 {
            return "\(days)d"
        } else if days == 1 {
            return "yesterday"
        } else if hours > 0 {
            return "\(hours)h"
        } else if minutes > 0 {
            return "\(minutes)m"
        } else {
            return "\(seconds)s"
        }
    }
}
