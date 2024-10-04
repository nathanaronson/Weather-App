//
//  FetchData.swift
//  Weather App
//
//  Created by Nathan Aronson (student LM) on 1/6/23.
//

import Foundation

class FetchData: ObservableObject {
    
    @Published var response = Response()
    
    func getData() async {
        
        let URLString = "https://api.weatherapi.com/v1/current.json?key=8d5b1b6f60934f9681a141524222212&q=19096&aqi=no"

        guard let url = URL(string: URLString) else {return}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                        
            let response = try JSONDecoder().decode(Response.self, from: data)
            self.response = response
        } catch {
            print(error)
        }
    }
}

struct Response: Codable {
    var location: Location = Location()
    var current: Current = Current()
}

struct Location: Codable {
    var name: String = ""
    var region: String = ""
}

struct Current: Codable {
    var temp_f: Double = 0
    var condition: Condition = Condition()
    var humidity: Int = 0
    var cloud: Int = 0
    var feelslike_f: Double = 0
}

struct Condition: Codable {
    var text: String = ""
    var icon: String = ""
}
