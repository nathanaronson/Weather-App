//
//  ForecastDayView.swift
//  Weather App
//
//  Created by Nathan Aronson (student LM) on 1/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ForecastDayView: View {
    
    var day: Day
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(day.condition.text)")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Text("Max Temp: ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("\(String(format: "%.0f", day.maxtemp_f)) °F")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                HStack {
                    Text("Min Temp: ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("\(String(format: "%.0f", day.mintemp_f)) °F")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            KFImage(URL(string: "https:" + day.condition.icon))
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .shadow(radius: 2)
        }
        .padding()
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(10)
    }
}

struct ForecastDayView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayView(day: Day())
    }
}
