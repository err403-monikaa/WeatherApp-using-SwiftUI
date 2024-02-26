//
//  HeaderView.swift
//  Weather
//
//  Created by Monikaa on 23/02/24.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var currentDate = Date()
    
    var weatherData: WeatherData
    
    var body: some View {
        VStack {
            Text("\(currentDate, formatter: dateFormatter)")
                .fontWeight(.light)
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter
    }
}

