//
//  ContentView.swift
//  CalendarWeekView
//
//  Created by Rahul Ravi Prakash on 05/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var allWeeks: [[DateUtility.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                DatePicker(.init(""), selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .background(.teal.gradient)
                    .cornerRadius(5)
                    .onChange(of: selectedDate) { _ , newDate in
                        scrollToWeek(containing: newDate)
                    }
                Spacer()
                Button {
                    selectedDate = Date()
                    scrollToWeek(containing: selectedDate)
                } label: {
                    Label("Today", systemImage: "calendar")
                        .padding(8)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            
            TabView(selection: $currentWeekIndex) {
                ForEach(allWeeks.indices, id: \.self) { index in
                    WeekView(selectedDate: allWeeks[index].first!.date)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 65)
            
            
        }
        .padding()
        .onAppear {
            allWeeks = DateUtility.shared.generateWeeks(around: selectedDate)
            scrollToWeek(containing: selectedDate)
        }
    }
    
    private func scrollToWeek(containing date: Date) {
        if let index = allWeeks.firstIndex(where: { week in
            week.contains(where: { Calendar.current.isDate($0.date, inSameDayAs: date) })
        }) {
            withAnimation {
                currentWeekIndex = index
            }
        }
    }
}

#Preview {
    ContentView()
}





