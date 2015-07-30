//
//  Flag.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/19/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

public struct Flag {
    public let darkSkyUnavailable: Bool?
    public let darkSkyStations: Array<String>?
    public let dataPointStations: Array<String>?
    public let isdStations: Array<String>?
    public let lampStations: Array<String>?
    public let metarStations: Array<String>?
    public let metnoLicense: Bool?
    public let sources: Array<String>?
    public let units: String
    
    init(fromJSON json: NSDictionary) {
        darkSkyUnavailable = json["darksky-unavailable"] as? Bool
        darkSkyStations = json["darksky-stations"] as? Array<String>
        dataPointStations = json["datapoint-stations"] as? Array<String>
        isdStations = json["isd-stations"] as? Array<String>
        lampStations = json["lamp-stations"] as? Array<String>
        metarStations = json["metar-stations"] as? Array<String>
        metnoLicense = json["metno-license"] as? Bool
        sources = json["sources"] as? Array<String>
        units = json["units"] as! String
    }
}
