//
//  CurrentWeatherModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//


import Foundation

struct CurrentWeatherModel: Codable {
    let name: String?
    let weather: [Weather]
    let main: MainWeather
    let wind: Wind
    let clouds: Clouds
}

struct Weather: Codable {
    let main: String?
    let description: String?
    let icon: String?
}

struct MainWeather: Codable {
    let temp: Double?
    let tempMin: Double?
    let tempMax: Double?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

struct Wind: Codable {
    let speed: Double?
}

struct Clouds: Codable {
    let all: Int?
}
