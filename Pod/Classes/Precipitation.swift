//
//  Precipitation.swift
//  Pods
//
//  Created by Satyam Ghodasara on 12/20/15.
//
//

import Foundation

/**
    Types of precipitation.
 
    - Rain: Rainy.
    - Snow: Snowy.
    - Sleet: Sleety, freezing rain, ice pellets, or wintery mix.
    - Hail: Haily.
*/
public enum Precipitation: String {
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Hail = "hail"
}
