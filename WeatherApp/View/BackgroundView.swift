//
//  BackgroundView.swift
//  Weather
//
//  Created by Monikaa on 23/02/24.
//

import SwiftUI

struct BackgroundView: View {
    
    @State private var backgroundGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        let background = Rectangle()
            .fill(backgroundGradient)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { timer in
                    updateBackgroundColor()
                }
            }
            .blur(radius: 200, opaque: true)
            .edgesIgnoringSafeArea(.all)
        
        return background
    }
    
    func updateBackgroundColor() {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        if (6...17).contains(currentHour) {
            backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
        } else {
            backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 20/255, green: 31/255, blue: 78/255), Color(red: 141/255, green: 87/255, blue: 151/255)]), startPoint: .top, endPoint: .bottom)
        }
    }
}


