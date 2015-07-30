//
//  Alert.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/18/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

public struct Alert {
    public let title: String
    public let expires: NSDate
    public let description: String
    public let uri: NSURL
    
    init(fromJSON json: NSDictionary) {
        title = json["title"] as! String
        expires = NSDate(timeIntervalSince1970: json["expires"] as! Double)
        description = json["description"] as! String
        uri = NSURL(string: json["uri"] as! String)!
    }
}