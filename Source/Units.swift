//
//  Units.swift
//  ForecastIO
//
//  Created by Wojciech Rutkowski on 05/01/2016.
//
//

import Foundation

/// Units in which the Dark Sky API data will be returned.
public enum Units: String, Decodable {
    
    /// SI units. More details are available [in the Dark Sky API docs](https://darksky.net/dev/docs/forecast).
    case si = "si"
    
    /// US units and the default option.
    case us = "us"
    
    /// Canadian units. Identical to `.si` except `windSpeed` is in kilometers per hour.
    case ca = "ca"
    
    /// UK units. Identical to `.si` except `windSpeed` is in miles per hour, and `nearestStormDistance` and `visibility` are in miles.
    case uk = "uk2"
    
    /// Automatically use the appropriate units based on the location for which you are requesting data.
    case auto = "auto"
    
}
