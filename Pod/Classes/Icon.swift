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
 
    - ClearDay: A clear day.
    - ClearNight: A clear night.
    - Rain: A rainy day or night.
    - Snow: A snowy day or night.
    - Sleet: A sleety day or night.
    - Wind: A windy day or night.
    - Fog: A foggy day or night.
    - Cloudy: A cloudy day or night.
    - PartlyCloudyDay: A partly cloudy day.
    - PartlyCloudyNight: A partly cloudy night.
*/
public enum Icon: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
}
