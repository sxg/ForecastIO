//
//  Result.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 9/25/16.
//
//

import Foundation

/// Represents whether a request was successful or encountered an error.
///
/// - success: The request and all post processing operations were successful resulting in the serialization of the provided associated value.
/// - failure: The request encountered an error resulting in a failure. The associated values are the original data provided by the server as well as the error that caused the failure.
public enum Result<Value> {
    case success(Value, RequestMetadata)
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
