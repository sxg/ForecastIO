//
//  ViewController.swift
//  iOS Example
//
//  Created by Satyam Ghodasara on 1/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import ForecastIO

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let client = APIClient(apiKey: "Test Key")
        client.units = .Auto
        client.getForecast(latitude: 30, longitude: 30, excludeForecastFields: [.Alerts, .Currently, .Daily, .Flags, .Minutely]) { (forecast, error) in
            print(forecast?.hourly?.data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

