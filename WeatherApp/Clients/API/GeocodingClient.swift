//
//  GeocodingClient.swift
//  WeatherApp
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

enum NetworkError: Error {
    case invalidResponse
}

struct GeocodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location? {
        
        let (data, response) = try await URLSession.shared.data(from: Endpoint.endpointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
    }
    
}
