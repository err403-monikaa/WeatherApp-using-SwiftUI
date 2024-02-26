//
//  WeatherMainView.swift
//  Weather
//
//  Created by Monikaa on 23/02/24.
//

import SwiftUI

struct WeatherMainView: View {
    
    @State var viewmodel = WeatherViewModel()
    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView(weatherData: viewmodel.weatherData ?? WeatherData())
                Spacer()
                CurrentWeatherView(weatherData: viewmodel.weatherData ?? WeatherData())
                Spacer()
                DailyWeatherView(weatherData: viewmodel.weatherData ?? WeatherData())
                Spacer()
            }
        }.colorScheme(.dark)
            .task {
                viewmodel.getWetherData()
            }
    }
}


