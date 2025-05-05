//
//  WeekView.swift
//  CalendarWeekView
//
//  Created by Rahul Ravi Prakash on 05/05/25.
//

import SwiftUI

struct WeekView: View {
    
    let weekDays = DateUtility.shared.getWeekDates(withDateFormat: .day, andDayFormat: .shortDayOfWeek)
    
    var body: some View {
        HStack {
            ForEach(weekDays) { day in
                
                DayView(date: day.dateString, day: day.dayString)
            }
        }
    }
}

#Preview {
    WeekView()
}
