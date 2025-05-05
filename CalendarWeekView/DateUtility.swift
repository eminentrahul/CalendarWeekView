//
//  DateFormatsTypes.swift
//  CalendarWeekView
//
//  Created by Rahul Ravi Prakash on 05/05/25.
//

import Foundation

class DateUtility {
    
    static let shared = DateUtility()
    
    private init() {}
    
    enum DateFormatType: String {
        // Date Only
        case yyyyMMdd = "yyyy-MM-dd"
        case ddMMyyyy = "dd-MM-yyyy"
        case MMddyyyy = "MM-dd-yyyy"
        case dMMMMyyyy = "d MMMM yyyy"
        case MMMdyyyy = "MMM d, yyyy"
        case fullDate = "EEEE, MMMM d, yyyy"
        case day = "d"
        
        // Time Only
        case HHmm = "HH:mm"
        case hhmmA = "hh:mm a"
        case HHmmss = "HH:mm:ss"
        
        // Date and Time
        case yyyyMMddHHmm = "yyyy-MM-dd HH:mm"
        case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
        case ddMMyyyyHHmm = "dd-MM-yyyy HH:mm"
        case MMMdyyyyhmmA = "MMM d, yyyy h:mm a"
        case fullDateTime = "EEEE, MMMM d, yyyy 'at' h:mm a"
        
        // ISO Formats
        case isoDate = "yyyy-MM-dd'T'HH:mm:ssZ"
        case isoDateMilliseconds = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        // Custom/Other
        case dayOfWeek = "EEEE"
        case shortDayOfWeek = "EEE"
        case monthYear = "MMMM yyyy"
        case shortMonthYear = "MMM yyyy"
        case monthDay = "MMMM d"
    }
    
    struct WeekDay: Identifiable {
        let id = UUID()
        let date: Date
        let dateString: String
        let dayString: String
    }
    
    func getWeekDates(withDateFormat dateFormat: DateFormatType, andDayFormat dayFormat: DateFormatType) -> [WeekDay] {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        
        // Calculate the start of the week (assuming week starts on Sunday)
        let startOfWeek = calendar.date(byAdding: .day, value: -(weekday - calendar.firstWeekday), to: today)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = dayFormat.rawValue
        
        // Generate the next 7 days
        return (0..<7).compactMap { offset in
            if let date = calendar.date(byAdding: .day, value: offset, to: startOfWeek) {
                return WeekDay(
                    date: date,
                    dateString: dateFormatter.string(from: date),
                    dayString: dayFormatter.string(from: date)
                )
            }
            return nil
        }
    }
}
