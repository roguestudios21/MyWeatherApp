//
//  WeatherIcon.swift
//  MyWeatherApp
//
//  Created by Atharv  on 08/07/25.
//


//
//  WeatherIcon.swift
//  MyWeatherApp
//
//  Created by Atharv on 07/07/25.
//

import Foundation

enum WeatherIcon: String {
    case clearDay = "01d"
    case clearNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenCloudsDay = "04d"
    case brokenCloudsNight = "04n"
    case showerRainDay = "09d"
    case showerRainNight = "09n"
    case rainDay = "10d"
    case rainNight = "10n"
    case thunderstormDay = "11d"
    case thunderstormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50d"
    case mistNight = "50n"
    
    var symbolName: String {
        switch self {
        case .clearDay: return "sun.max.fill"
        case .clearNight: return "moon.fill"
        case .fewCloudsDay: return "cloud.sun.fill"
        case .fewCloudsNight: return "cloud.moon.fill"
        case .scatteredCloudsDay, .brokenCloudsDay: return "cloud.fill"
        case .scatteredCloudsNight, .brokenCloudsNight: return "cloud.fill"
        case .showerRainDay, .showerRainNight: return "cloud.drizzle.fill"
        case .rainDay: return "cloud.sun.rain.fill"
        case .rainNight: return "cloud.moon.rain.fill"
        case .thunderstormDay, .thunderstormNight: return "cloud.bolt.rain.fill"
        case .snowDay, .snowNight: return "snowflake"
        case .mistDay, .mistNight: return "cloud.fog.fill"
        }
    }
    
    var backgroundVideoName: String {
        switch self {
        case .clearDay:
            return "sunny"
        case .clearNight:
            return "clear_night"
        case .fewCloudsDay, .scatteredCloudsDay, .brokenCloudsDay:
            return "cloudy_day"
        case .fewCloudsNight, .scatteredCloudsNight, .brokenCloudsNight:
            return "cloudy_night"
        case .showerRainDay, .rainDay, .thunderstormDay, .snowDay, .mistDay:
            return "rainy_day" // or "storm_day", "snow_day", etc. if you have separate videos
        case .showerRainNight, .rainNight, .thunderstormNight, .snowNight, .mistNight:
            return "rainy_night" // same here: could use separate "storm_night" etc.
        }
    }
}
