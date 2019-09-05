//
//  Forecast.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation
import CoreLocation

/// The weather data for a location at a specific time.
public struct Forecast: Decodable {
    
    /// The requested location.
    public let location: CLLocationCoordinate2D
    
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
    public enum Field: String, Decodable {
        
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
    
    /// Creates a new `Forecast` from JSON using `Decodable`.
    ///
    /// - parameter decoder: JSON decoder (provided by `Decodable`).
    ///
    /// - returns: A new `Forecast` configured by the requested JSON.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.alerts = try container.decodeIfPresent([Alert].self, forKey: .alerts)
        self.flags = try container.decodeIfPresent(Flag.self, forKey: .flags)
        self.currently = try container.decodeIfPresent(DataPoint.self, forKey: .currently)
        self.minutely = try container.decodeIfPresent(DataBlock.self, forKey: .minutely)
        self.hourly = try container.decodeIfPresent(DataBlock.self, forKey: .hourly)
        self.daily = try container.decodeIfPresent(DataBlock.self, forKey: .daily)
        let lat = try container.decode(Double.self, forKey: .latitude)
        let lon = try container.decode(Double.self, forKey: .longitude)
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    /// Map `Forecast`'s properties to JSON keys.
    private enum CodingKeys: String, CodingKey {
        case timezone, alerts, flags, currently, minutely, hourly, daily
        case latitude, longitude
    }
    
}
