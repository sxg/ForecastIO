//
//  Flag.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/19/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// A class that contains various metadata information related to a `Forecast` request.
public struct Flag {
    
    /// The presence of this property indicates that the Dark Sky data source supports the `Forecast`'s location, but a temporary error (such as a radar station being down for maintenance) has made the data unavailable.
    public let darkSkyUnavailable: Bool?
    
    /// Contains the IDs for each radar station used in servicing the `Forecast` request.
    public let darkSkyStations: Array<String>?
    
    /// Contains the IDs for each `DataPoint` station used in servicing this request.
    public let dataPointStations: Array<String>?
    
    /// Contains the IDs for each ISD station used in servicing this request.
    public let isdStations: Array<String>?
    
    /// Contains the IDs for each LAMP station used in servicing this request.
    public let lampStations: Array<String>?
    
    /// Contains the IDs for each METAR station used in servicing this request.
    public let metarStations: Array<String>?
    
    /// The presence of this property indicates that data from api.met.no was used to facilitate this request (as per their license agreement with Forecast.io).
    public let metnoLicense: Bool?
    
    /// Contains the IDs for each data station used in servicing this request.
    public let sources: Array<String>?
    
    /// The presence of this property indicates which units were used for the data in this request. "US" units are default.
    public let units: String?
    
    /**
        Creates a new `Flag` from a JSON object.
     
        - parameter fromJSON: A JSON object with keys corresponding to the `Flag`'s properties.
     
        - returns: A new `Flag` filled with data from the given JSON object.
    */
    public init(fromJSON json: NSDictionary) {
        darkSkyUnavailable = json["darksky-unavailable"] as? Bool
        darkSkyStations = json["darksky-stations"] as? Array<String>
        dataPointStations = json["datapoint-stations"] as? Array<String>
        isdStations = json["isd-stations"] as? Array<String>
        lampStations = json["lamp-stations"] as? Array<String>
        metarStations = json["metar-stations"] as? Array<String>
        metnoLicense = json["metno-license"] as? Bool
        sources = json["sources"] as? Array<String>
        units = json["units"] as? String
    }
}
