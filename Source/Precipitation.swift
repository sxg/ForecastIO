//
//  Precipitation.swift
//  Pods
//
//  Created by Satyam Ghodasara on 12/20/15.
//
//

import Foundation

/// Types of precipitation.
///
/// - rain:  Rainy.
/// - snow:  Snowy.
/// - sleet: Sleety, freezing rain, ice pellets, or wintery mix.
/// - hail:  Haily.
public enum Precipitation: String {
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
    case hail = "hail"
}
