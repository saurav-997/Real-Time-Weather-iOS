//
//  WeatherDetails.swift
//  RealTimeWeather
//
//  Created by Mac_Mini-M1 on 17/06/21.
//

import Foundation

struct WeatherDetails {
    
    let temp : Double
    let city : String
    let maxTemp : Double
    let minTemp : Double
    let pressure : Int
    let humidity : Int
    let main: String
    let id: Int
    let feelsLikeTemp: Double
    let visibility: Int
    let windSpeed: Double
    let country: String
    let sunrise: Int
    let sunset: Int
    
    

    var SunRise: String {
        let date = Date(timeIntervalSince1970: Double(sunrise))
           let dateFormatter = DateFormatter()
           dateFormatter.timeStyle = DateFormatter.Style.short
           let localDate = dateFormatter.string(from: date)
        return localDate
    }
    var SunSet: String{
        let date = Date(timeIntervalSince1970: Double(sunset))
           let dateFormatter = DateFormatter()
           dateFormatter.timeStyle = DateFormatter.Style.short
           let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    
    var conditionName: String {
        switch id {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.heavyrain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 711:
            return "smoke.fill"
        case 721:
            return "sun.haze.fill"
        case 731:
            return "sun.dust.fill"
        case 741:
            return "cloud.fog.fill"
        case 761:
        return "sun.dust.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "sun.max"
            
        }
    }
    
}
