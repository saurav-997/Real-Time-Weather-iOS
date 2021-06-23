//
//  WeatherModel.swift
//  RealTimeWeather
//
//  Created by Mac_Mini-M1 on 17/06/21.
//

import Foundation

struct WeatherModel: Decodable {
    
    var name: String
    var visibility: Int
    var main: temperatureDetails
    var weather: [weatherInfo]
    var wind: Wind
    var sys: MoreInfo
}
struct Wind: Decodable{
    var speed: Double
    var deg: Int
}
struct MoreInfo: Decodable {
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct temperatureDetails: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct weatherInfo: Decodable {
    var id: Int
    var main: String
}

