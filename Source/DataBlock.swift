//
//  DataBlock.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// Weather data for a specific location over a period of time.
public struct DataBlock: Decodable {
    
    /// A human-readable text summary.
    public let summary: String?
    
    /// A machine-readable summary of the weather suitable for selecting an icon for display.
    public let icon: Icon?
    
    /// `DataPoint`s ordered by time, which describe the weather conditions at the requested location over time.
    public let data: [DataPoint]
    
}
