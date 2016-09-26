//
//  Field.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 9/25/16.
//
//

import Foundation

public extension Forecast {
    /**
     Data fields associated with a `Forecast`.
     */
    public enum Field: String {
        /// Current weather conditions.
        case currently = "currently"
        
        /// Minute-by-minute weather conditions for the next hour.
        case minutely = "minutely"
        
        /// Hour-by-hour weather conditions for the next two days by default but can be exte1nded to one week.
        case hourly = "hourly"
        
        /// Day-by-day weather conditions for the next week.
        case daily = "daily"
        
        /// Severe weather alerts.
        case alerts = "alerts"
        
        /// Miscellaneous metadata.
        case flags = "flags"
    }
}
