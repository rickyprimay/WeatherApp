//
//  WeatherClient.swift
//  WeatherApp
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

struct WeatherClient {
    
    func fetchWeather(location: Location) async throws -> Weather {
        
        let (data, response) = try await URLSession.shared.data(from : Endpoint.endpointURL(for: .weatherByLatLon(location.lat, location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
        
    }
    
}
