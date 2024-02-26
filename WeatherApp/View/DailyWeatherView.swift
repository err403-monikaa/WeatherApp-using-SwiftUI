//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Monikaa on 23/02/24.
//

import SwiftUI
import RealmSwift

struct DailyWeatherView: View {
    
    @State private var weatherIcon = ImageConstant.dayIcon
    
    var weatherData: WeatherData
    
    var body: some View {
        VStack {
            HStack {
                Text(Constant.forcastTitle)
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.leading)
            
            ForEach(Array((weatherData.dailyTemperature).enumerated()), id: \.offset) { index, element in
                ZStack {
                    HStack {
                        let day = Common.getDay(dateString: weatherData.date[index])
                        Text(day)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text((String(weatherData.dailyTemperature[index]) + weatherData.dailyTemperatureUnit))
                            .fontWeight(.light)
                        
                        Image(weatherIcon, bundle: nil)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 30)
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { timer in
                                    updateWeatherIcon()
                                }
                            }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(Color(.systemFill))
                    .cornerRadius(10)
                    .padding([.leading, .trailing])
                }
            }
        }
    }
    
    func updateWeatherIcon() {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        if (6...17).contains(currentHour) {
            weatherIcon = ImageConstant.dayIcon
        } else {
            weatherIcon = ImageConstant.nightIcon
        }
    }
}



