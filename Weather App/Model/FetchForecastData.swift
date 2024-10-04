//
//  FetchForecastData.swift
//  Weather App
//
//  Created by Nathan Aronson (student LM) on 1/11/23.
//

import Foundation

class FetchForecastData: ObservableObject {
    
    @Published var response = ForecastResponse()
    
    func getData() async {
        
        let URLString = "https://api.weatherapi.com/v1/forecast.json?key=8d5b1b6f60934f9681a141524222212&q=19096&days=7&aqi=no&alerts=no"

        guard let url = URL(string: URLString) else {return}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let response = try JSONDecoder().decode(ForecastResponse.self, from: data)
            self.response = response
        } catch {
            print(error)
        }
    }
}

struct ForecastResponse: Codable {
    var forecast: Forecast = Forecast()
}

struct Forecast: Codable {
    var forecastday: [ForecastDay] = [ForecastDay(), ForecastDay(), ForecastDay()]
}

struct ForecastDay: Codable {
    var day: Day = Day()
}

struct Day: Codable {
    var maxtemp_f: Double = 0
    var mintemp_f: Double = 0
    var condition: Condition = Condition()
}
