//
//  WeatherModelController.swift
//  RealTimeWeather
//
//  Created by Mac_Mini-M1 on 17/06/21.
//

import Foundation

protocol WeatherDelegate {
    func updateWeather(_ weather: WeatherDetails)
}

struct WeatherModelController {
    
    let api_key = "a9a9cf5f865128787bff4c5479330c39"
    var delegate : WeatherDelegate?
    
    func startWeatherUpdate(lat: Double, long: Double){
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(api_key)&units=metric"
        let URL = URL(string: url)!
        let task = URLSession.shared.dataTask(with: URL){ (data,response,error) in
            if let safeData = data{
                if let weather = self.parseJSON(data: safeData){
                    delegate?.updateWeather(weather)
                }else{
                    
                }
            }else{
                print(error ?? "nil")
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data)->WeatherDetails?{
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(WeatherModel.self, from: data)
            let temp = data.main.temp
            let city = data.name
            let maxTemp = data.main.temp_max
            let minTemp = data.main.temp_min
            let pressure = data.main.pressure
            let humidity = data.main.humidity
            let name = data.weather[0].main
            let id = data.weather[0].id
            let feelsLike = data.main.feels_like
            let visibility = data.visibility
            let windSpeed = data.wind.speed
            let country = data.sys.country
            let sunrise = data.sys.sunrise
            let sunset = data.sys.sunset
            
            let WeatherData = WeatherDetails(temp: temp, city: city, maxTemp: maxTemp, minTemp: minTemp, pressure: pressure, humidity: humidity, main: name, id: id,feelsLikeTemp: feelsLike,visibility: visibility,windSpeed: windSpeed,country: country, sunrise: sunrise, sunset: sunset)
            print(WeatherData)
            return WeatherData
        }
        catch{
            print(error)
            return nil
        }
    }
    
}
