//
//  cuurrentWeather.swift
//  Pogoda
//
//  Created by Karol Zmyslowski on 01.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import Alamofire

class currentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp : Double!
    
    var cityName : String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    var weatherType: String {
        if _weatherType  == nil {
            _weatherType = "nie dziala"
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: BASE_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            print(result)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let mainT = weather[0]["main"] as? String {
                        self._weatherType = mainT
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let temp = main["temp"] as? Double{
                        let kelvinToCelsjusPre = temp - 273.15
                        let kelvinToCelsjus = Double(round(10 * kelvinToCelsjusPre/10))
                        self._currentTemp = kelvinToCelsjus
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
        
    }
}









