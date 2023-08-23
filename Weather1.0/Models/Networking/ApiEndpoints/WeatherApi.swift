//
//  WeatherApi.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 8/23/23.
//

import Foundation

struct WeatherApi {
    
    static var baseURL: String = "https://api.weatherapi.com/v1/"
    
    static func getCurrentWeatherApi() -> String {
        let apiEndpoint = WeatherApi.baseURL + "current weather"
        return apiEndpoint
    }
    
}
