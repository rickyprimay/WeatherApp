//
//  Weather.swift
//  WeatherApp
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
