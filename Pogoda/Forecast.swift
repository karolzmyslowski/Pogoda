//
//  Forecast.swift
//  Pogoda
//
//  Created by Karol Zmyslowski on 02.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType:String!
    var _highTemp:String!
    var _lowTemp:String!
    
    var date:String{
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType:String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp:String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let kelvinToCelsjusPre = min - 273.15
                let kelvinToCelsjus = Double(round(10 * kelvinToCelsjusPre/10))
                self._lowTemp = String(kelvinToCelsjus)
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCelsjusPre = max - 273.15
                let kelvinToCelsjus = Double(round(10 * kelvinToCelsjusPre/10))
                self._highTemp = String(kelvinToCelsjus)
            }
        }
    }
}











