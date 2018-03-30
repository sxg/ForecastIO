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

    /// The time at which this `DataPoint` occurs.
    public let time: Date
    
    /// A human-readable text summary of the weather.
    public let summary: String?
    
    /// A machine-readable summary of the weather suitable for selecting an icon for display.
    public let icon: Icon?
    
    /// The time of the last sunrise before the solar noon closest to local noon on the given day. Only defined on `Forecast`'s `daily` `DataPoint`s. Note: near the poles, this may occur on a different day entirely!
    public let sunriseTime: Date?
    
    /// The time of the first sunset after the solar noon closest to local noon on the given day. Only defined on `Forecast`'s `daily` `DataPoint`s. Note: near the poles, this may occur on a different day entirely!
    public let sunsetTime: Date?
    
    /// The fractional part of the lunation number of the given day. This can be thought of as the "percentage complete" of the current lunar month. A value of `0` represents a new moon, a value of `0.25` represents a first quarter moon, a value of `0.5` represents a full moon, and a value of `0.75` represents a last quarter moon. The ranges between these values represent waxing crescent, waxing gibbous, waning gibbous, and waning crescent moons, respectively. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let moonPhase: Double?
    
    /// The distance to the nearest storm in miles. This value is *very approximate* and should not be used in scenarios requiring accurate results. A storm distance of `0` doesn't necessarily refer to a storm at the requested location, but rather a storm in the vicinity of the requested location. Only defined on `Forecast`'s `currently` `DataPoint`s.
    public let nearestStormDistance: Double?
    
    /// The direction of the nearest storm in degrees, with true north at 0º and progressing clockwise. If `nearestStormDistance` is `0`, then this value will be `nil`. The caveats that apply to `nearestStormDistance` apply to this too. Only defined on `Forecast`'s `currently` `DataPoint`s.
    public let nearestStormBearing: Double?
    
    /// The average expected intensity in inches of liquid water per hour of precipitation occurring at the given time *conditional on probability* (assuming any precipitation occurs at all). A *very* rough guide is that a value of `0` corresponds to no precipitation, `0.002` corresponds to very light precipitation, `0.017` corresponds to light precipitation, `0.1` corresponds to moderate precipitation, and `0.4` corresponds to heavy precipitation.
    public let precipitationIntensity: Double?
    
    /// Maximum expected intensity of precipitation on the given day in inches of liquid water per hour. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let precipitationIntensityMax: Double?
    
    /// Time at which the maximum expected intensity of precipitation will occur. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let precipitationIntensityMaxTime: Date?
    
    /// Value between `0` and `1` (inclusive) representing the probability of precipitation occurring at the given time.
    public let precipitationProbability: Double?
    
    /// Type of precipitation occurring at the given time. If `precipIntensity` is `0`, then this will be `nil`.
    public let precipitationType: Precipitation?
    
    /// The amount of snowfall accumulation expected to occur on the given day, in inches. This will be `nil` if no accumulation is expected. Only defined on `Forecast`'s `hourly` and `daily` `DataPoint`s.
    public let precipitationAccumulation: Double?
    
    /// The temperature at the given time in degrees Fahrenheit. Not defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperature: Double?
    
    /// The minimum temperature on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMin: Double?
    
    /// The time at which the minimum temperature will occur on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMinTime: Date?
    
    /// The maximum temperature on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMax: Double?
    
    /// The time at which the maximum temperature will occur on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMaxTime: Date?
    
    /// The apparent or "feels like" temperature at the given time in degrees Fahrenheit. Not defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperature: Double?
    
    /// The minimum apparent or "feels like" temperature on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMin: Double?
    
    /// The time at which the minimum apparent or "feels like" temperature will occur on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMinTime: Date?
    
    /// The maximum apparent or "feels like" temperature on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMax: Double?
    
    /// The time at which the maximum apparent or "feels like" temperature will occur on the given day in degrees Fahrenheit. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMaxTime: Date?
    
    /// The dew point at the given time in degrees Fahrenheit.
    public let dewPoint: Double?
    
    /// The wind speed at the given time in miles per hour.
    public let windSpeed: Double?
    
    /// The direction that the wind is coming from in degrees, with true north at 0º and progressing clockwise. If `windSpeed` is `0`, then this will be `nil`.
    public let windBearing: Double?
    
    /// Value between `0` and `1` (inclusive) representing the percentage of sky occluded by clouds. A value of `0` corresponds to a clear sky, `0.4` corresponds to scattered clouds, `0.75` correspond to broken cloud cover, and `1` corresponds to completely overcast skies.
    public let cloudCover: Double?
    
    /// Value between `0` and `1` (inclusive) representing the relative humidity.
    public let humidity: Double?
    
    /// The sea-level air pressure in millibars.
    public let pressure: Double?
    
    /// The average visibility in miles, capped at `10`.
    public let visibility: Double?
    
    /// The columnar density of total atomspheric ozone at the given time in Dobson units.
    public let ozone: Double?
    
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
        temperatureMin = json["temperatureMin"] as? Double
        if let jsonTemperatureMinTime = json["temperatureMinTime"] as? Double {
            temperatureMinTime = Date(timeIntervalSince1970: jsonTemperatureMinTime)
        } else {
            temperatureMinTime = nil
        }
        temperatureMax = json["temperatureMax"] as? Double
        if let jsonTemperatureMaxTime = json["temperatureMaxTime"] as? Double {
            temperatureMaxTime = Date(timeIntervalSince1970: jsonTemperatureMaxTime)
        } else {
            temperatureMaxTime = nil
        }
        apparentTemperature = json["apparentTemperature"] as? Double
        apparentTemperatureMin = json["apparentTemperatureMin"] as? Double
        if let jsonApparentTemperatureMinTime = json["apparentTemperatureMinTime"] as? Double {
            apparentTemperatureMinTime = Date(timeIntervalSince1970: jsonApparentTemperatureMinTime)
        } else {
            apparentTemperatureMinTime = nil
        }
        apparentTemperatureMax = json["apparentTemperatureMax"] as? Double
        if let jsonApparentTemperatureMaxTime = json["apparentTemperatureMaxTime"] as? Double {
            apparentTemperatureMaxTime = Date(timeIntervalSince1970: jsonApparentTemperatureMaxTime)
        } else {
            apparentTemperatureMaxTime = nil
        }
        dewPoint = json["dewPoint"] as? Double
        windSpeed = json["windSpeed"] as? Double
        windBearing = json["windBearing"] as? Double
        cloudCover = json["cloudCover"] as? Double
        humidity = json["humidity"] as? Double
        pressure = json["pressure"] as? Double
        visibility = json["visibility"] as? Double
        ozone = json["ozone"] as? Double
    }
}
