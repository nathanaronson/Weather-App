//
//  CurrentView.swift
//  Weather App
//
//  Created by Nathan Aronson (student LM) on 1/6/23.
//

import SwiftUI
import struct Kingfisher.KFImage

struct CurrentView: View {
    
    @StateObject var data = FetchData()
    
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0)
                .background(
                        LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .top, endPoint: .bottom)
                    )
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("\(data.response.location.name), \(data.response.location.region)")
                        .font(Font.title.weight(.bold))
                        .foregroundColor(.white)
                        .task {
                            await data.getData()
                        }
                    Spacer()
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Temperature")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("\(String(format: "%.0f", data.response.current.temp_f))° F")
                            .font(.title)
                            .foregroundColor(.white)
                            .task {
                                await data.getData()
                            }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Feels Like")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("\(String(format: "%.0f", data.response.current.feelslike_f))° F")
                            .font(.title)
                            .foregroundColor(.white)
                            .task {
                                await data.getData()
                            }
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Current Condition")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("\(data.response.current.condition.text)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .task {
                                    await data.getData()
                                }
                        }
                        Spacer()
                        KFImage(URL(string: "https:" + data.response.current.condition.icon))
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Humidity")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("\(data.response.current.humidity)%")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .task {
                                    await data.getData()
                                }
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Cloud")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("\(data.response.current.cloud)%")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .task {
                                    await data.getData()
                                }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView()
    }
}
