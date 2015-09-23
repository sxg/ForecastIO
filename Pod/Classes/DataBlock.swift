//
//  DataBlock.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

public struct DataBlock {
    public let summary: String?
    public let icon: Icon?
    public let data: Array<DataPoint>?
    
    init(fromJSON json: NSDictionary) {
        
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
