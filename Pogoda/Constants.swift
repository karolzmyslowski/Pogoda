//
//  Constants.swift
//  Pogoda
//
//  Created by Karol Zmyslowski on 01.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitute)&appid=376271efe6205ed0e9e02fedadffd6fe"

let latitude = "20"
let longitute = "54"

typealias DownloadComplete = () -> ()

