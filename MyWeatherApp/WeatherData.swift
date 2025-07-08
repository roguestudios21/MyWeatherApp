//
//  WeatherData.swift
//  MyWeatherApp
//
//  Created by Atharv  on 08/07/25.
//


import Foundation

struct WeatherData: Decodable, Equatable {
    let name: String          // City name
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
    struct Main: Decodable, Equatable {
        let temp: Double
        let humidity: Int
    }
    
    struct Weather: Decodable, Equatable {
        let description: String
        let icon: String
    }
    
    struct Wind: Decodable, Equatable {
        let speed: Double
        let deg: Int
    }
}
