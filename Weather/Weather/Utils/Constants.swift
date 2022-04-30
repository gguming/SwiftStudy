//
//  Constants.swift
//  Weather
//
//  Created by 장희선 on 2022/04/08.
//

import Foundation


struct Constants {
    struct URLs {
        static func weather(city: String) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d4d2197844201a340f15ad9e285acc93&units=imperial"
        }
        
//        &units=imperial
    }
}
