//
//  DayView.swift
//  CalendarWeekView
//
//  Created by Rahul Ravi Prakash on 05/05/25.
//

import SwiftUI

struct DayView: View {
    
    @State var date: String = "15"
    @State var day: String = "Wed"
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Rectangle()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipShape(.buttonBorder)
                    .foregroundStyle(.teal)
                
                VStack {
                    Text(date)
                        .font(.title3)
                        .bold()
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                    
                    Text(day)
                        .font(.subheadline)
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    DayView()
}
