//
//  Alert.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// A severe weather warning issued for a location by a governmental authority (consult the Dark Sky API documentation for a full list).
public struct Alert {
    
    /// A short text summary of the `Alert`.
    public let title: String
    
    /// The time at which this alert was issued.
    public let time: Date
    
    /// The time at which the `Alert` will cease to be valid.
    public let expires: Date?
    
    /// A detailed text description of the `Alert` from the appropriate weather service.
    public let description: String
    
    /// An HTTP(S) URI that contains detailed information about the `Alert`.
    public let uri: URL
    
    /// Regions covered by the `Alert`.
    public let regions: [String]
    
    /// The severity of the `Alert`.
    public let severity: Severity
    
    /// Severity categories of `Alert`s.
    public enum Severity: String {
        
        /// `advisory` `Alert`s tell an individual to be aware of potentially severe weather.
        case advisory = "advisory"
        
        /// `watch` `Alert`s tell an individual to prepare for potentially severe weather.
        case watch = "watch"
        
        /// `warning` `Alert`s tell an individual to take immediate action to protect themselves and others from potentially severe weather.
        case warning = "warning"
    }
    
    /// Creates a new `Alert` from a JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the `Alert`'s properties.
    ///
    /// - returns: A new `Alert` filled with data from the given JSON object.
    public init(fromJSON json: NSDictionary) {
        title = json["title"] as! String
        if let jsonExpires = json["expires"] as? Double {
            expires = Date(timeIntervalSince1970: jsonExpires)
        } else {
            expires = nil
        }
        time = Date(timeIntervalSince1970: json["time"] as! Double)
        uri = URL(string: json["uri"] as! String)!
        description = json["description"] as! String
        regions = json["regions"] as! [String]
        severity = Severity(rawValue: json["severity"] as! String)!
    }
}
