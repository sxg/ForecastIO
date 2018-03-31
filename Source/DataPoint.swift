//
//  DataPoint.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/10/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// Weather data for a specific location and time.
public struct DataPoint {

    /// The time at which this `DataPoint` begins. `minutely` `DataPoint`s are always aligned to the top of the minute, `hourly` `DataPoint`s to the top of the hour, and `daily` `DataPoint`s to midnight of the day, all according to the local timezone.
    public let time: Date
    
    /// A human-readable text summary of this `DataPoint`.
    public let summary: String?
    
    /// A machine-readable text summary of this data point, suitable for selecting an icon for display.
    public let icon: Icon?
    
    /// The time when the sun will rise during a given day. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let sunriseTime: Date?
    
    /// The time when the sun will set during a given day. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let sunsetTime: Date?
    
    /// The fractional part of the lunation number during the given day: a value of `0` corresponds to a new moon, `0.25` to a first quarter moon, `0.5` to a full moon, and `0.75` to a last quarter moon. The ranges in between these represent waxing crescent, waxing gibbous, waning gibbous, and waning crescent moons, respectively. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let moonPhase: Double?
    
    /// The approximate distance to the nearest storm. A storm distance of `0` doesn't necessarily refer to a storm at the requested location, but rather a storm in the vicinity of that location. Only defined on `Forecast`'s `currently` `DataPoint`s.
    public let nearestStormDistance: Double?
    
    /// The approximate direction of the nearest storm in degrees, with true north at 0º and progressing clockwise. If `nearestStormDistance` is `0`, then this value will be `nil`. Only defined on `Forecast`'s `currently` `DataPoint`s.
    public let nearestStormBearing: Double?
    
    /// The intensity of precipitation occuring at the given time. This value is *conditional on probability* (that is, assuming any precipitation falls at all) for `minutely` `DataPoint`s, and unconditional otherwise.
    public let precipitationIntensity: Double?
    
    /// The maximum value of `precipitationIntensity` during a given day. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let precipitationIntensityMax: Double?
    
    /// The time at which `precipitationIntensityMax` occurs during a given day. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let precipitationIntensityMaxTime: Date?
    
    /// The probability of precipitation occurring, between `0` and `1`, inclusive.
    public let precipitationProbability: Double?
    
    /// The type of precipitation occurring at the given time. If `precipIntensity` is `0`, then this will be `nil`.
    public let precipitationType: Precipitation?
    
    /// The amount of snowfall accumulation expected to occur. This will be `nil` if no accumulation is expected. Only defined on `Forecast`'s `hourly` and `daily` `DataPoint`s.
    public let precipitationAccumulation: Double?
    
    /// The air temperature. Not defined on `Forecast`'s `minutely` `DataPoint`s.
    public let temperature: Double?
    
    /// The overnight low temperature. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureLow: Double?
    
    /// The time at which the overnight low temperature occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureLowTime: Date?
    
    /// The daytime high temperature. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureHigh: Double?
    
    /// The time at which the daytime high temperature occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureHighTime: Date?
    
    /// The apparent or "feels like" temperature. Not defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperature: Double?
    
    /// The overnight low apparent temperature. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureLow: Double?
    
    /// The time at which the overnight low apparent temperature occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureLowTime: Date?
    
    /// The daytime high apparent temperature. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureHigh: Double?
    
    /// The time at which the daytime high apparent temperature occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureHighTime: Date?
    
    /// The dew point at the given time.
    public let dewPoint: Double?
    
    /// The wind gust speed.
    public let windGust: Double?
    
    /// The wind speed at the given time.
    public let windSpeed: Double?
    
    /// The direction that the wind is coming *from* in degrees, with true north at 0º and progressing clockwise. If `windSpeed` is `0`, then this will be `nil`.
    public let windBearing: Double?
    
    /// The percentage of sky occluded by clouds, between `0` and `1`, inclusive.
    public let cloudCover: Double?
    
    /// The relative humidity, between `0` and `1`, inclusive.
    public let humidity: Double?
    
    /// The sea-level air pressure.
    public let pressure: Double?
    
    /// The average visibility, capped at 10 miles.
    public let visibility: Double?
    
    /// The columnar density of total atomspheric ozone at the given time in Dobson units.
    public let ozone: Double?
    
    /// The UV index.
    public let uvIndex: Double?
    
    /// The time at which the maximum UV index occurs during the given day. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let uvIndexTime: Date?
    
    /// Creates a new `DataPoint` from a JSON object.
    ///
    /// - parameter json: A JSON object with keys corresponding to the `DataPoint`'s properties.
    ///
    /// - returns: A new `DataPoint` filled with data from the given JSON object.
    public init(fromJSON json: NSDictionary) {
        time = Date(timeIntervalSince1970: json["time"] as! Double)
        summary = json["summary"] as? String
        if let jsonIcon = json["icon"] as? String {
            icon = Icon(rawValue: jsonIcon)
        } else {
            icon = nil
        }
        if let jsonSunriseTime = json["sunriseTime"] as? Double {
            sunriseTime = Date(timeIntervalSince1970: jsonSunriseTime)
        } else {
            sunriseTime = nil
        }
        if let jsonSunsetTime = json["sunsetTime"] as? Double {
            sunsetTime = Date(timeIntervalSince1970: jsonSunsetTime)
        } else {
            sunsetTime = nil
        }
        moonPhase = json["moonPhase"] as? Double
        nearestStormDistance = json["nearestStormDistance"] as? Double
        nearestStormBearing = json["nearestStormBearing"] as? Double
        precipitationIntensity = json["precipIntensity"] as? Double
        precipitationIntensityMax = json["precipIntensityMax"] as? Double
        if let jsonPrecipitationIntensityMaxTime = json["precipIntensityMaxTime"] as? Double {
            precipitationIntensityMaxTime = Date(timeIntervalSince1970: jsonPrecipitationIntensityMaxTime)
        } else {
            precipitationIntensityMaxTime = nil
        }
        precipitationProbability = json["precipProbability"] as? Double
        if let jsonPrecipitationType = json["precipType"] as? String {
            precipitationType = Precipitation(rawValue: jsonPrecipitationType)
        } else {
            precipitationType = nil
        }
        precipitationAccumulation = json["precipAccumulation"] as? Double
        temperature = json["temperature"] as? Double
        temperatureLow = json["temperatureLow"] as? Double
        if let jsonTemperatureLowTime = json["temperatureLowTime"] as? Double {
            temperatureLowTime = Date(timeIntervalSince1970: jsonTemperatureLowTime)
        } else {
            temperatureLowTime = nil
        }
        temperatureHigh = json["temperatureHigh"] as? Double
        if let jsonTemperatureHighTime = json["temperatureHighTime"] as? Double {
            temperatureHighTime = Date(timeIntervalSince1970: jsonTemperatureHighTime)
        } else {
            temperatureHighTime = nil
        }
        apparentTemperature = json["apparentTemperature"] as? Double
        apparentTemperatureLow = json["apparentTemperatureLow"] as? Double
        if let jsonApparentTemperatureLowTime = json["apparentTemperatureLowTime"] as? Double {
            apparentTemperatureLowTime = Date(timeIntervalSince1970: jsonApparentTemperatureLowTime)
        } else {
            apparentTemperatureLowTime = nil
        }
        apparentTemperatureHigh = json["apparentTemperatureHigh"] as? Double
        if let jsonApparentTemperatureHighTime = json["apparentTemperatureHighTime"] as? Double {
            apparentTemperatureHighTime = Date(timeIntervalSince1970: jsonApparentTemperatureHighTime)
        } else {
            apparentTemperatureHighTime = nil
        }
        dewPoint = json["dewPoint"] as? Double
        windGust = json["windGust"] as? Double
        windSpeed = json["windSpeed"] as? Double
        windBearing = json["windBearing"] as? Double
        cloudCover = json["cloudCover"] as? Double
        humidity = json["humidity"] as? Double
        pressure = json["pressure"] as? Double
        visibility = json["visibility"] as? Double
        ozone = json["ozone"] as? Double
        uvIndex = json["uvIndex"] as? Double
        if let jsonUVIndexTime = json["uvIndexTime"] as? Double {
            uvIndexTime = Date(timeIntervalSince1970: jsonUVIndexTime)
        } else {
            uvIndexTime = nil
        }
    }
}
