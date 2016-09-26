//
//  Result.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 9/25/16.
//
//

import Foundation

/// Used to represent whether a request was successful or encountered an error.
public enum Result<Value> {
    /// The request and all post processing operations were successful resulting in the serialization of the provided associated value.
    case success(Value)
    
    /// The request encountered an error resulting in a failure. The associated values are the original data provided by the server as well as the error that caused the failure.
    case failure(Error)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    public var isFailure: Bool {
        return !isSuccess
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
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
