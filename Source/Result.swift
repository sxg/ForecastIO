//
//  Result.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 9/25/16.
//
//

import Foundation

/// Represents whether a request was successful or encountered an error.
public enum Result<Value> {
    
    /// The request and all post processing operations were successful.
    case success(Value, RequestMetadata)
    
    /// The request encountered an error resulting in a failure.
    case failure(Error)
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: (Value?, RequestMetadata?) {
        switch self {
        case .success(let value, let requestMetadata):
            return (value, requestMetadata)
        case .failure:
            return (nil, nil)
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
