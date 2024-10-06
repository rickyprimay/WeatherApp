//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    
    @State private var isFetchingWeather: Bool = false
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    @State private var weather: Weather?
    
    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city) else { return }
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather {
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            Spacer()
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp - 273.15))
                    .font(.system(size: 100))
                if weather.temp - 273.15 >= 34 {
                    Text("Hot")
                        .font(.title)
                } else if weather.temp - 273.15 >= 20 {
                    Text("Warm")
                        .font(.title)
                } else {
                    Text("Cold")
                        .font(.title)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
