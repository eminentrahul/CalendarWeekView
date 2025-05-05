//
//  ContentView.swift
//  CalendarWeekView
//
//  Created by Rahul Ravi Prakash on 05/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WeekView()
                .frame(height: 70)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}





