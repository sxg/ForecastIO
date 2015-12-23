//
//  Forecast.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// The weather data for a location at a specific time.
public struct Forecast {
    /// MARK: - Metadata
    
    /// The requested latitude.
    public let latitude: Float
    
    /// The requested longitude.
    public let longitude: Float
    
    /// The IANA timezone name for the requested location (e.g. "America/New_York"). Rely on local user settings over this property.
    public let timezone: String
    
    /// The current timezone offset in hours from GMT.
    public let offset: Int?
    
    /// Severe weather `Alert`s issued by a governmental weather authority for the requested location.
    public let alerts: Array<Alert>?
    
    /// Metadata for the request.
    public let flags: Flag?
    
    /// MARK: - Forecast data
    
    /// The current weather conditions at the requested location.
    public let currently: DataPoint?
    
    /// The minute-by-minute weather conditions at the requested location for the next hour aligned to the nearest minute.
    public let minutely: DataBlock?
    
    /// The hourly weather conditions at the requested location for the next two days aligned to the top of the hour.
    public let hourly: DataBlock?
    
    /// The daily weather conditions at the requested location for the next week aligned to midnight of the day.
    public let daily: DataBlock?
    
    /**
        Creates a new `Forecast` from a JSON object.
     
        - parameter fromJSON: A JSON object with keys corresponding to the `Forecast`'s properties.
     
        - returns: A new `Forecast` filled with data from the given JSON object.
     */
    public init(fromJSON json: NSDictionary) {
        latitude = json["latitude"] as! Float
        longitude = json["longitude"] as! Float
        timezone = json["timezone"] as! String
        
        if let jsonOffset = json["offset"] as? Int {
            offset = jsonOffset
        } else {
            offset = nil
        }
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
        
        if let jsonAlerts = json["alerts"] as? Array<NSDictionary> {
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