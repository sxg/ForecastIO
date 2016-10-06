//
//  Units.swift
//  ForecastIO
//
//  Created by Wojciech Rutkowski on 05/01/2016.
//
//

import Foundation

/// Units in which the Dark Sky API data will be returned.
///
/// - si:   SI units. More details are available [in the Dark Sky API docs](https://darksky.net/dev/docs/forecast).
/// - us:   US units and the default option.
/// - ca:   Canadian units. Identical to `.SI` except `windSpeed` is in kilometers per hour.
/// - uk:   UK units. Identical to `.SI` except `windSpeed` is in miles per hour, and `nearestStormDistance` and `visibility` are in miles.
/// - auto: Automatically use the appropriate units based on the location for which you are requesting data.
public enum Units: String {
    case si = "si"
    case us = "us"
    case ca = "ca"
    case uk = "uk2"
    case auto = "auto"
}
