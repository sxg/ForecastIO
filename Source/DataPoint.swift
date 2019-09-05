//
//  DataPoint.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/10/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// Weather data for a specific location and time.
public struct DataPoint: Decodable {

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
    
    /// The intensity (in inches of liquid water per hour) of precipitation occuring at the given time. This value is *conditional on probability* (that is, assuming any precipitation falls at all) for `minutely` `DataPoint`s, and unconditional otherwise.
    public let precipitationIntensity: Double?
    
    /// The standard deviation of the distribution of `precipitationIntensity`. This property is only available when the full distribution and not just the expected mean can be estimated with accuracy.
    public let precipitationIntensityError: Double?
    
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
    
    /// The maximum temperature during a given date. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMax: Double?
    
    /// The time at which the maximum temperature during a given date occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMaxTime: Date?
    
    /// The minimum temperature during a given date. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMin: Double?
    
    /// The time at which the minimum temperature during a given date occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let temperatureMinTime: Date?
    
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
    
    /// The maximum apparent temperature during a given date. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMax: Double?
    
    /// The time at which the maximum apparent temperature during a given date occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMaxTime: Date?
    
    /// The minimum apparent temperature during a given date. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMin: Double?
    
    /// The time at which the minimum apparent temperature during a given date occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let apparentTemperatureMinTime: Date?
    
    /// The dew point at the given time.
    public let dewPoint: Double?
    
    /// The wind gust speed.
    public let windGust: Double?
    
    /// The time at which the maximum wind gust speed during a given date occurs. Only defined on `Forecast`'s `daily` `DataPoint`s.
    public let windGustTime: Date?
    
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
    
    /// Map `DataPoint`'s properties to JSON keys.
    private enum CodingKeys: String, CodingKey {
        case precipitationType = "precipType"
        case precipitationIntensity = "precipIntensity"
        case precipitationIntensityError = "precipIntensityError"
        case precipitationIntensityMax = "precipIntensityMax"
        case precipitationIntensityMaxTime = "precipIntensityMaxTime"
        case precipitationProbability = "precipProbability"
        case precipitationAccumulation = "precipAccumulation"
        case time, summary, icon, sunriseTime, sunsetTime, moonPhase, nearestStormDistance, nearestStormBearing, temperature, temperatureLow, temperatureLowTime, temperatureHigh, temperatureHighTime, temperatureMax, temperatureMaxTime, temperatureMin, temperatureMinTime, apparentTemperature, apparentTemperatureLow, apparentTemperatureLowTime, apparentTemperatureHigh, apparentTemperatureHighTime, apparentTemperatureMax, apparentTemperatureMaxTime, apparentTemperatureMin, apparentTemperatureMinTime, dewPoint, windGust, windGustTime, windSpeed, windBearing, cloudCover, humidity, pressure, visibility, ozone, uvIndex, uvIndexTime
    }
    
}
