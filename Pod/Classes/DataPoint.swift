//
//  DataPoint.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/10/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

public struct DataPoint {
    public let time: NSDate
    public let summary: String?
    public let icon: Icon?
    public let sunriseTime: NSDate?
    public let sunsetTime: NSDate?
    public let moonPhase: Float?
    public let nearestStormDistance: Float?
    public let nearestStormBearing: Float?
    public let precipIntensity: Float?
    public let precipIntensityMax: Float?
    public let precipIntensityMaxTime: NSDate?
    public let precipProbability: Float?
    public let precipType: String?
    public let precipAccumulation: Float?
    public let temperature: Float?                    //  Fahrenheit
    public let temperatureMin: Float?                 //  Fahrenheit
    public let temperatureMinTime: NSDate?
    public let temperatureMax: Float?                 //  Fahrenheit
    public let temperatureMaxTime: NSDate?
    public let apparentTemperature: Float?            //  Fahrenheit
    public let apparentTemperatureMin: Float?         //  Fahrenheit
    public let apparentTemperatureMinTime: NSDate?
    public let apparentTemperatureMax: Float?         //  Fahrenheit
    public let apparentTemperatureMaxTime: NSDate?
    public let dewPoint: Float?
    public let windSpeed: Float?
    public let windBearing: Float?
    public let cloudCover: Float?
    public let humidity: Float?
    public let pressure: Float?
    public let visibility: Float?
    public let ozone: Float?
    
    init(fromJSON json: NSDictionary) {
        time = NSDate(timeIntervalSince1970: json["time"] as! Double)
        summary = json["summary"] as? String
        if let jsonIcon = json["icon"] as? String {
            icon = Icon(rawValue: jsonIcon)
        } else {
            icon = nil
        }
        if let jsonSunriseTime = json["sunriseTime"] as? Double {
            sunriseTime = NSDate(timeIntervalSince1970: jsonSunriseTime)
        } else {
            sunriseTime = nil
        }
        if let jsonSunsetTime = json["sunsetTime"] as? Double {
            sunsetTime = NSDate(timeIntervalSince1970: jsonSunsetTime)
        } else {
            sunsetTime = nil
        }
        moonPhase = json["moonPhase"] as? Float
        nearestStormDistance = json["nearestStormDistance"] as? Float
        nearestStormBearing = json["nearestStormBearing"] as? Float
        precipIntensity = json["precipIntensity"] as? Float
        precipIntensityMax = json["precipIntensityMax"] as? Float
        if let jsonPrecipIntensityMaxTime = json["precipIntensityMaxTime"] as? Double {
            precipIntensityMaxTime = NSDate(timeIntervalSince1970: jsonPrecipIntensityMaxTime)
        } else {
            precipIntensityMaxTime = nil
        }
        precipProbability = json["precipProbability"] as? Float
        precipType = json["precipType"] as? String
        precipAccumulation = json["precipAccumulation"] as? Float
        temperature = json["temperature"] as? Float
        temperatureMin = json["temperatureMin"] as? Float
        if let jsonTemperatureMinTime = json["temperatureMinTime"] as? Double {
            temperatureMinTime = NSDate(timeIntervalSince1970: jsonTemperatureMinTime)
        } else {
            temperatureMinTime = nil
        }
        temperatureMax = json["temperatureMax"] as? Float
        if let jsonTemperatureMaxTime = json["temperatureMaxTime"] as? Double {
            temperatureMaxTime = NSDate(timeIntervalSince1970: jsonTemperatureMaxTime)
        } else {
            temperatureMaxTime = nil
        }
        apparentTemperature = json["apparentTemperature"] as? Float
        apparentTemperatureMin = json["apparentTemperatureMin"] as? Float
        if let jsonApparentTemperatureMinTime = json["apparentTemperatureMinTime"] as? Double {
            apparentTemperatureMinTime = NSDate(timeIntervalSince1970: jsonApparentTemperatureMinTime)
        } else {
            apparentTemperatureMinTime = nil
        }
        apparentTemperatureMax = json["apparentTemperatureMax"] as? Float
        if let jsonApparentTemperatureMaxTime = json["apparentTemperatureMaxTime"] as? Double {
            apparentTemperatureMaxTime = NSDate(timeIntervalSince1970: jsonApparentTemperatureMaxTime)
        } else {
            apparentTemperatureMaxTime = nil
        }
        dewPoint = json["dewPoint"] as? Float
        windSpeed = json["windSpeed"] as? Float
        windBearing = json["windBearing"] as? Float
        cloudCover = json["cloudCover"] as? Float
        humidity = json["humidity"] as? Float
        pressure = json["pressure"] as? Float
        visibility = json["visibility"] as? Float
        ozone = json["ozone"] as? Float
    }
}
