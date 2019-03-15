//
//  Precipitation.swift
//  Pods
//
//  Created by Satyam Ghodasara on 12/20/15.
//
//

import Foundation

/// Types of precipitation.
public enum Precipitation: String, Decodable {
    
    /// Rainy.
    case rain = "rain"
    
    /// Snowy.
    case snow = "snow"
    
    /// Sleet, freezing rain, ice pellets, or wintery mix.
    case sleet = "sleet"
    
    /// Haily.
    case hail = "hail"
    
}
