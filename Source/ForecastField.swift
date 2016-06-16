//
//  ForecastField.swift
//  ForecastIO
//
//  Created by Miwand Najafe on 2016-06-14.
//
//

import Foundation

/**
    Data fields associated with a `Forecast`.
*/
public enum ForecastField: String, CustomStringConvertible {
    /// Current weather conditions.
    case Currently = "currently"
    
    /// Minute-by-minute weather conditions for the next hour.
    case Minutely = "minutely"
    
    /// Hour-by-hour weather conditions for the next two days by default but can be extended to one week.
    case Hourly = "hourly"
    
    /// Day-by-day weather conditions for the next week.
    case Daily = "daily"
    
    /// Severe weather alerts.
    case Alerts = "alerts"
    
    /// Miscellaneous metadata.
    case Flags = "flags"
    
    /**
        Returns the `String` value of the enum variant.
     
        - returns: `String` value of the enum variant.
    */
    public var description: String {
        return rawValue
    }
}

