//
//  Weather.swift
//  WeatherApp
//
//  Created by 장희선 on 2022/01/25.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}


struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
    
}
