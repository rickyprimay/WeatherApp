//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

enum Endpoint {
    
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatLon(Double, Double)
    
    private var path: String {
        switch self {
            case .coordinatesByLocationName(let city):
                return "/geo/1.0/direct?q=\(city)&appid=\(Constant.Keys.weatherApiKey)"
            case .weatherByLatLon(let lat, let lon):
                return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constant.Keys.weatherApiKey)"
        }
    }
    
    static func endpointURL(for endpoint: Endpoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
    
}
