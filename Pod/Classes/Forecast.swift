//
//  Forecast.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

public struct Forecast {
    //  Metadata
    public let latitude: Float
    public let longitude: Float
    public let timezone: String
    public let offset: Int
    
    //  Forecast data
    public let currently: DataPoint?
    public let minutely: DataBlock? //  Ideally has data for the next hour
    public let hourly: DataBlock?   //  Ideally has data for the next two days
    public let daily: DataBlock?    //  Ideally has data for the next week
    
    public let alerts: Array<Alert>?
    public let flags: Flag?
    
    init(fromJSON json: NSDictionary) {
        latitude = json["latitude"] as! Float
        longitude = json["longitude"] as! Float
        timezone = json["timezone"] as! String
        offset = json["offset"] as! Int
        
        if let jsonCurrently = json["currently"] as? NSDictionary {
            currently = DataPoint(fromJSON: jsonCurrently)
        } else {
            currently = nil
        }
        if let jsonMinutely = json["minutely"] as? NSDictionary {
            minutely = DataBlock(fromJSON: jsonMinutely)
        } else {
            minutely = nil
        }
        if let jsonHourly = json["hourly"] as? NSDictionary {
            hourly = DataBlock(fromJSON: jsonHourly)
        } else {
            hourly = nil
        }
        if let jsonDaily = json["daily"] as? NSDictionary {
            daily = DataBlock(fromJSON: jsonDaily)
        } else {
            daily = nil
        }
        
        if let jsonAlerts = json["alerts"] as? Array<NSDictionary> {
            var tempAlerts = [Alert]()
            for jsonAlert in jsonAlerts {
                tempAlerts.append(Alert(fromJSON: jsonAlert))
            }
            alerts = tempAlerts
        } else {
            alerts = nil
        }
        
        if let jsonFlags = json["flags"] as? NSDictionary {
            flags = Flag(fromJSON: jsonFlags)
        } else {
            flags = nil
        }
    }
}