//
//  ForecastView.swift
//  Weather App
//
//  Created by Nathan Aronson (student LM) on 1/11/23.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ForecastView: View {
    
    @ObservedObject var forecastData = FetchForecastData()

    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0)
                .background(
                        LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .top, endPoint: .bottom)
                    )
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(forecastData.response.forecast.forecastday.indices) { index in
                    ForecastDayView(day: forecastData.response.forecast.forecastday[index].day)
                }
            }.task {
                await forecastData.getData()
            }
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
