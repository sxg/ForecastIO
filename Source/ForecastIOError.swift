//
//  ForecastIOError.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 9/26/16.
//
//

import Foundation

/// Represents errors in interacting with the Dark Sky API.
///
/// - invalidJSON: Error due to invalid JSON.
public enum ForecastIOError: Error {
    case invalidJSON(Data)
}
