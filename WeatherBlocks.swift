//
//  WeatherBlocks.swift
//  ForecastIO
//
//  Created by Miwand Najafe on 2016-06-14.
//
//

import Foundation


/*
 Exclude some number of data blocks from the API response. This is useful for reducing latency and saving 
 cache space. [blocks] should be a comma-delimeted list (without spaces) of any of the following: currently, 
 minutely, hourly, daily, alerts, flags. (Crafting a request with all of the above blocks excluded is 
 exceedingly silly and not recommended.)
*/

// Block types to be used for exclusion
public enum WeatherBlocks: String, CustomStringConvertible {
    //
    case Currently = "currently"
    case Minutely = "minutely"
    case Hourly = "hourly"
    case Daily = "daily"
    case Alerts = "alerts"
    case Flags = "flags"
    
    public var description: String {
        return rawValue
    }
}

