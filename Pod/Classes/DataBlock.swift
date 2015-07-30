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
    public let data: Array<DataPoint>
    
    init(fromJSON json: NSDictionary) {
        summary = json["summary"] as? String
        
        if let jsonIcon = json["icon"] as? String {
            icon = Icon(rawValue: jsonIcon)
        } else {
            icon = nil
        }
        
        var tempData = [DataPoint]()
        for jsonDataPoint in json["data"] as! Array<NSDictionary> {
            tempData.append(DataPoint(fromJSON: jsonDataPoint))
        }
        data = tempData
    }
}
