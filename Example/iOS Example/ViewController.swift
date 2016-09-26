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
        
        let client = APIClient(apiKey: "FAKE-API-KEY")
        client.units = .auto
        client.language = .english
        client.getForecast(latitude: 30, longitude: 30, excludeForecastFields: [.alerts, .currently, .daily, .flags, .minutely]) { (result) in
            switch result {
            case .success(let forecast):
                print(forecast.hourly?.data)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

