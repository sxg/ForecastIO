//
//  Units.swift
//  Forecast.io
//
//  Created by Wojciech Rutkowski on 05/01/2016.
//
//

import Foundation

/// Units in which the Forecast.io data may be returned.
public enum Units: String, CustomStringConvertible {
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
    case SI = "si"
    
    /// US units and the default option.
    case US = "us"
    
    /// Canadian units. Identical to `.SI` except `windSpeed` is in kilometers per hour.
    case CA = "ca"
    
    /// UK units. Deprecated by the Forecast.io API. Use `.UK2` instead. Identical to `.SI` except `windSpeed` is in miles per hour.
    case UK = "uk"
    
    /// UK units. Identical to `.SI` except `windSpeed` is in miles per hour, and `nearestStormDistance` and `visibility` are in miles.
    case UK2 = "uk2"
    
    /// Automatically use the appropriate units based on the location for which you are requesting data.
    case Auto = "auto"
    
    /**
        Returns the `String` value of the enum variant.
     
        - returns: `String` value of the enum variant.
    */
    public var description: String {
        return rawValue
    }
}