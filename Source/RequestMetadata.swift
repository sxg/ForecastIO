//
//  RequestMetadata.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 10/2/16.
//
//

import Foundation

/// Metadata about the consumption of the Dark Sky API.
public struct RequestMetadata {
    
    /// `Cache-Control` HTTP header for responses from the Dark Sky API.
    public let cacheControl: String?
    
    /// Number of API requests made by the current API key for today.
    public let apiRequestsCount: Int?
    
    /// Server-side response time of the current request in milliseconds.
    public let responseTime: Float?

    /// Creates a new `RequestMetadata` from a `Dictionary` of Dark Sky API response headers.
    ///
    /// - parameter headers: A `Dictionary` containing Dark Sky API response headers.
    ///
    /// - returns: A new `RequestMetadata` filled with data from the given Dark Sky API response headers `Dictionary`.
    public init(fromHTTPHeaders headers: [AnyHashable: Any]) {
        cacheControl = headers["Cache-Control"] as? String
        if let forecastAPICallsHeader = headers["X-Forecast-API-Calls"] as? String {
            apiRequestsCount = Int(forecastAPICallsHeader)
        } else {
            apiRequestsCount = nil
        }
        if var responseTimeHeader = headers["X-Response-Time"] as? String {
            // Remove "ms" units from the string
            responseTimeHeader = responseTimeHeader.trimmingCharacters(in: CharacterSet.letters)
            responseTime = Float(responseTimeHeader)
        } else {
            responseTime = nil
        }
    }
}
