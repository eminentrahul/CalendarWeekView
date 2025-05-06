//
//  WeekView.swift
//  CalendarWeekView
//
//  Created by Rahul Ravi Prakash on 05/05/25.
//

import SwiftUI

struct WeekView: View {
    @State var selectedDate: Date
    
    var body: some View {
        
        let weekDays = DateUtility.shared.getWeekDates(forDate: selectedDate)
        
        HStack {
            ForEach(weekDays) { day in
                
                DayView(date: day.dateString, day: day.dayString)
            }
        }
        .padding(4)
    }
}

#Preview {
    WeekView(selectedDate: Date())
}
