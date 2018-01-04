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
    
    private var _date: String!
    private var _weatherType:String!
    private var _highTemp:String!
    private var _lowTemp:String!
    
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
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let min = temp["temp_min"] as? Double {
                let kelvinToCelsjusPre = min - 273.15
                let kelvinToCelsjus = Double(round(10 * kelvinToCelsjusPre/10))
                print(kelvinToCelsjus)
                self._lowTemp = String(kelvinToCelsjus)
            }
            
            if let max = temp["temp_max"] as? Double {
                let kelvinToCelsjusPre = max - 273.15
                let kelvinToCelsjus = Double(round(10 * kelvinToCelsjusPre/10))
                self._highTemp = String(kelvinToCelsjus)
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            dateFormatter.timeZone = TimeZone.current
            self._date = dateFormatter.string(from: unixConvertedDate as Date)
        }
     }
}





