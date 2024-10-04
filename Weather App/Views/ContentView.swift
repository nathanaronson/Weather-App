//
//  ContentView.swift
//  Weather App
//
//  Created by Nathan Aronson (student LM) on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CurrentView()
                .tabItem {
                    Image(systemName: "thermometer.sun")
                    Text("Current")
                }
            ForecastView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Forecast")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
