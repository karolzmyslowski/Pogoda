//
//  WeatherCell.swift
//  Pogoda
//
//  Created by Karol Zmyslowski on 03.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = String(forecast.highTemp)
        dayLabel.text = forecast.date
        weatherType.text = forecast.weatherType
        weatherImage.image = UIImage(named: forecast.weatherType)
    }
}
