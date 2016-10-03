//
//  APIMetadata.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 10/2/16.
//
//

import Foundation

/// Metadata about the consumption of the Dark Sky API.
public struct APIMetadata {
    
    /// `Cache-Control` HTTP header for responses from the Dark Sky API.
    public let cacheControl: String
    
    /// Number of API requests made by the current API key for today.
    public let apiRequestsCount: Int
    
    /// Server-side response time of the request in milliseconds.
    public let responseTime: Float
}
