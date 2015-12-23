//
//  DataPointIcon.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/**
    Types of weather conditions. Additional values may be defined in the future, so be sure to use a default.
*/
public enum Icon: String {
    /// A clear day.
    case ClearDay = "clear-day"
    
    /// A clear night.
    case ClearNight = "clear-night"
    
    /// A rainy day or night.
    case Rain = "rain"
    
    /// A snowy day or night.
    case Snow = "snow"
    
    /// A sleety day or night.
    case Sleet = "sleet"
    
    /// A windy day or night.
    case Wind = "wind"
    
    /// A foggy day or night.
    case Fog = "fog"
    
    /// A cloudy day or night.
    case Cloudy = "cloudy"
    
    /// A partly cloudy day.
    case PartlyCloudyDay = "partly-cloudy-day"
    
    /// A partly cloudy night.
    case PartlyCloudyNight = "partly-cloudy-night"
}
