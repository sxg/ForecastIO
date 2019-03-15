//
//  ForecastIOError.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 9/26/16.
//
//

import Foundation

/// Represents errors in interacting with the Dark Sky API.
public enum ForecastIOError: Error {
    
    /// Error due to missing data.
    case missingData
    
    /// Error due to missing HTTP(S) headers.
    case missingHeaders
    
    /// Error due to unknown cause.
    case unexpectedError
    
}
