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

    /// Creates a new `RequestMetadata` from a `Dictionary` of Dark Sky API response header fields.
    ///
    /// - parameter headerFields: A `Dictionary` containing Dark Sky API response header fields.
    ///
    /// - returns: A new `RequestMetadata` filled with data from the given Dark Sky API response header fields `Dictionary`.
    public init(fromHTTPHeaderFields headerFields: [AnyHashable: Any]) {
        cacheControl = headerFields["Cache-Control"] as? String
        if let forecastAPICallsHeader = headerFields["x-forecast-api-calls"] as? String {
            apiRequestsCount = Int(forecastAPICallsHeader)
        } else {
            apiRequestsCount = nil
        }
        if var responseTimeHeader = headerFields["x-response-time"] as? String {
            // Remove "ms" units from the string
            responseTimeHeader = responseTimeHeader.trimmingCharacters(in: CharacterSet.letters)
            responseTime = Float(responseTimeHeader)
        } else {
            responseTime = nil
        }
    }
    
}
