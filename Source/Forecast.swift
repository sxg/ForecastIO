//
//  Forecast.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// The weather data for a location at a specific time.
public struct Forecast {
    
    /// The requested latitude.
    public let latitude: Float
    
    /// The requested longitude.
    public let longitude: Float
    
    /// The IANA timezone name for the requested location (e.g. "America/New_York"). Rely on local user settings over this property.
    public let timezone: String
    
    /// Severe weather `Alert`s issued by a governmental weather authority for the requested location.
    public let alerts: [Alert]?
    
    /// Metadata for the request.
    public let flags: Flag?
    
    /// The current weather conditions at the requested location.
    public let currently: DataPoint?
    
    /// The minute-by-minute weather conditions at the requested location for the next hour aligned to the nearest minute.
    public let minutely: DataBlock?
    
    /// The hourly weather conditions at the requested location for the next two days aligned to the top of the hour.
    public let hourly: DataBlock?
    
    /// The daily weather conditions at the requested location for the next week aligned to midnight of the day.
    public let daily: DataBlock?
    
    /// Data fields associated with a `Forecast`.
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
    
    /// Creates a new `Forecast` from a JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the `Forecast`'s properties.
    ///
    /// - returns: A new `Forecast` filled with data from the given JSON object.
    public init(fromJSON json: NSDictionary) {
        latitude = json["latitude"] as! Float
        longitude = json["longitude"] as! Float
        timezone = json["timezone"] as! String
        
        if let jsonCurrently = json["currently"] as? NSDictionary {
            currently = DataPoint(fromJSON: jsonCurrently)
        } else {
            currently = nil
        }
        if let jsonMinutely = json["minutely"] as? NSDictionary {
            minutely = DataBlock(fromJSON: jsonMinutely)
        } else {
            minutely = nil
        }
        if let jsonHourly = json["hourly"] as? NSDictionary {
            hourly = DataBlock(fromJSON: jsonHourly)
        } else {
            hourly = nil
        }
        if let jsonDaily = json["daily"] as? NSDictionary {
            daily = DataBlock(fromJSON: jsonDaily)
        } else {
            daily = nil
        }
        
        if let jsonAlerts = json["alerts"] as? [NSDictionary] {
            var tempAlerts = [Alert]()
            for jsonAlert in jsonAlerts {
                tempAlerts.append(Alert(fromJSON: jsonAlert))
            }
            alerts = tempAlerts
        } else {
            alerts = nil
        }
        
        if let jsonFlags = json["flags"] as? NSDictionary {
            flags = Flag(fromJSON: jsonFlags)
        } else {
            flags = nil
        }
    }
}
