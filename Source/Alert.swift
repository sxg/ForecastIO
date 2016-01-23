//
//  Alert.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// A severe weather warning issued for a location by a governmental authority (consult Forecast.io's Dark Sky API documentation for a full list).
public struct Alert {
    
    /// A short text summary of the `Alert`.
    public let title: String
    
    /// The time at which the `Alert` will cease to be valid.
    public let expires: NSDate
    
    /// A detailed text description of the `Alert` from the appropriate weather service.
    public let description: String?
    
    /// An HTTP(S) URI that contains detailed information about the `Alert`.
    public let uri: NSURL
    
    /**
        Creates a new `Alert` from a JSON object.
     
        - parameter fromJSON: A JSON object with keys corresponding to the `Alert`'s properties.
     
        - returns: A new `Alert` filled with data from the given JSON object.
    */
    public init(fromJSON json: NSDictionary) {
        title = json["title"] as! String
        expires = NSDate(timeIntervalSince1970: json["expires"] as! Double)
        uri = NSURL(string: json["uri"] as! String)!

        if let jsonDescription = json["description"] as? String {
            description = jsonDescription
        } else {
            description = nil
        }
    }
}