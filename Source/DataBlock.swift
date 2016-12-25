//
//  DataBlock.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// Weather data for a specific location over a period of time.
public struct DataBlock {
    
    /// A human-readable text summary.
    public let summary: String?
    
    /// A machine-readable summary of the weather suitable for selecting an icon for display.
    public let icon: Icon?
    
    /// `DataPoint`s ordered by time, which describe the weather conditions at the requested location over time.
    public let data: [DataPoint]
    
    /// Creates a new `DataBlock` from a JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the `DataBlock`'s properties.
    ///
    /// - returns: A new `DataBlock` filled with data from the given JSON object.
    public init(fromJSON json: NSDictionary) {
        summary = json["summary"] as? String
        if let jsonIcon = json["icon"] as? String {
            icon = Icon(rawValue: jsonIcon)
        } else {
            icon = nil
        }
        
        let jsonData = json["data"] as! [NSDictionary]
        var tempData = [DataPoint]()
        for jsonDataPoint in jsonData {
            tempData.append(DataPoint(fromJSON: jsonDataPoint))
        }
        data = tempData
    }
}
