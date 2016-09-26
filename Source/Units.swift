//
//  Units.swift
//  ForecastIO
//
//  Created by Wojciech Rutkowski on 05/01/2016.
//
//

import Foundation

/// Units in which the Dark Sky API data will be returned.
public enum Units: String {
    /**
         SI units. `Forecast` properties will become the following:
            - `summary`: temperature and snow accumulation units will be in degrees celsius or centimeters, respectively.
            - `nearestStormDistance`: kilometers
            - `precipIntensity`: millimeters per hour
            - `precipIntensityMax`: millimeters per hour
            - `precipAccumulation`: centimeters
            - `temperature`: degrees celsius
            - `temperatureMin`: degrees Celsius
            - `temperatureMax`: degrees Celsius
            - `apparentTemperature`: degrees Celsius
            - `dewPoint`: degrees Celsius
            - `windSpeed`: meters per second
            - `pressure`: hectopascals (equivalent to the default millibars)
            - `visibility`: kilometers
    */
    case si = "si"
    
    /// US units and the default option.
    case us = "us"
    
    /// Canadian units. Identical to `.SI` except `windSpeed` is in kilometers per hour.
    case ca = "ca"
    
    /// UK units. Identical to `.SI` except `windSpeed` is in miles per hour, and `nearestStormDistance` and `visibility` are in miles.
    case uk = "uk2"
    
    /// Automatically use the appropriate units based on the location for which you are requesting data.
    case auto = "auto"
}
