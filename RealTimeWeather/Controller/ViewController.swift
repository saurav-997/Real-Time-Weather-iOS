//
//  ViewController.swift
//  RealTimeWeather
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherNameLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windSpeedlabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var sunRiseLabel: UILabel!
    @IBOutlet weak var sunSetLabel: UILabel!
    
    var weatherObj = WeatherModelController()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        weatherObj.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: WeatherDelegate{
    func updateWeather(_ weather: WeatherDetails) {
        DispatchQueue.main.async {
            self.weatherImageView.image = UIImage(systemName: weather.conditionName)
            self.cityNameLabel.text = "\(weather.city), \(weather.country)"
            self.tempLabel.text = String(format: "%.0f",weather.temp)+" °C"
            self.maxTempLabel.text = String(format: "%.1f",weather.maxTemp)
            self.minTempLabel.text = String(format: "%.1f",weather.minTemp)
            self.pressureLabel.text = "Pressure : \(weather.pressure) hPa"
            self.humidityLabel.text = "Humidity : \(weather.humidity) %"
            self.weatherNameLabel.text = "\(weather.main)"
            self.feelsLikeLabel.text = "Feels Like \(weather.feelsLikeTemp) °C"
            self.visibilityLabel.text = "Visibility : \(weather.visibility) meter"
            self.windSpeedlabel.text = "Wind Speed : \(weather.windSpeed) meter/sec"
            self.sunSetLabel.text = "Sunset : \(weather.SunSet)"
            self.sunRiseLabel.text = "Sunrise : \(weather.SunRise)"
        }
    }
}

extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("Latitude \(latitude) and Longitude \(longitude)")
            weatherObj.startWeatherUpdate(lat: latitude, long:  longitude)
            manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
