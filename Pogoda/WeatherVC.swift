//
//  WeatherVC.swift
//  Pogoda
//
//  Created by Karol Zmyslowski on 01.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentTypeLabel: UILabel!
    @IBOutlet weak var TableView: UITableView!
    
    var currentWeatherr = currentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        currentWeatherr.downloadWeatherDetails {
            self.updateMainUI()
        }
        print(BASE_URL)
        print(currentWeatherr.weatherType)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func updateMainUI() {
        dateLabel.text = currentWeatherr.date
        currentTempLabel.text = "\(currentWeatherr.currentTemp)"
        currentTypeLabel.text = currentWeatherr.weatherType
        locationLabel.text = currentWeatherr.cityName
        currentImage.image = UIImage(named: currentWeatherr.weatherType)
    }
}

