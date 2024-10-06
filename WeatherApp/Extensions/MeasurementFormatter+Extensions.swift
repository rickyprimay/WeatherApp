//
//  MeasurementFormatter+Extensions.swift
//  WeatherApp
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

extension MeasurementFormatter {
    
    static func temperature(value: Double) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatter
        
        let temp = Measurement(value: value, unit: UnitTemperature.celsius)
        
        return formatter.string(from: temp)
        
    }
    
}
