//
//  DataPointIcon.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// Types of weather conditions. Additional values may be defined in the future, so be sure to use a default.
///
/// - clearDay:          A clear day.
/// - clearNight:        A clear night.
/// - rain:              A rainy day or night.
/// - snow:              A snowy day or night.
/// - sleet:             A sleety day or night.
/// - wind:              A windy day or night.
/// - fog:               A foggy day or night.
/// - cloudy:            A cloudy day or night.
/// - partlyCloudyDay:   A partly cloudy day.
/// - partlyCloudyNight: A partly cloudy night.
public enum Icon: String {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
    case wind = "wind"
    case fog = "fog"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
}
