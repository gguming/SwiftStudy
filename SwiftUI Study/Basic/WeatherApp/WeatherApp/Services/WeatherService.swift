//
//  WeatherService.swift
//  WeatherApp
//
//  Created by 장희선 on 2022/01/25.
//

import Foundation


class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) ->()) {
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d4d2197844201a340f15ad9e285acc93") else
        {completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
        
    }
}
