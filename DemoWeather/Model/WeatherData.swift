//
//  WeatherData.swift
//  DemoWeather
//
//  Created by Sudeepa Pal on 08/06/24.
//

import Foundation


struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
