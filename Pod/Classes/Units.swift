//
//  Units.swift
//  Forecast.io
//
//  Created by Wojciech Rutkowski on 05/01/2016.
//
//

import Foundation

/// Units in which the Forecast.io data may be returned.
public enum Units: String, CustomStringConvertible {
    case SI = "si"
    case US = "us"
    case CA = "ca"
    case UK = "uk"
    case UK2 = "uk2"
    case auto = "auto"
    
    public var description: String {
        return rawValue
    }
}