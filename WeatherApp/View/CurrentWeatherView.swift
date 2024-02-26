//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Monikaa on 23/02/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    var weatherData: WeatherData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(weatherData.city)
                    .font(.title)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .center)
            }.padding(0)
            
            HStack {
                Text(weatherData.currentTemperature)
                    .font(.system(size: 110))
                    .fontWeight(.ultraLight)
                    .frame(maxWidth: .infinity, alignment: .center)
            }.padding(20)
        }
    }
}

