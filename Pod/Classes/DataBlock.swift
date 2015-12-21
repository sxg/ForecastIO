//
//  DataBlock.swift
//  Forecast.io
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
    public let data: Array<DataPoint>?
    
    
    /**
        Creates a new `DataBlock` from a JSON object.
     
        - parameter fromJSON: A JSON object with keys corresponding to the `DataBlock`'s properties.
     
        - returns: A new `DataBlock` filled with data from the given JSON object.
    */
    public init(fromJSON json: NSDictionary) {
        
        if let jsonSummary = json["summary"] as? String {
            summary = jsonSummary
        } else {
            summary = nil
        }
        if let jsonIcon = json["icon"] as? String {
            icon = Icon(rawValue: jsonIcon)
        } else {
            icon = nil
        }
        
        if let jsonData = json["data"] as? Array<NSDictionary> {
            var tempData = [DataPoint]()
            for jsonDataPoint in jsonData {
                tempData.append(DataPoint(fromJSON: jsonDataPoint))
            }
            data = tempData
        } else {
            data = nil
        }
    }
}
