//
//  WeatherNetworkTask.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/2/23.
//

import Foundation
import SwiftyJSON

enum WeatherResponse {
    case currentWeather(CurrentWeather)
    case searchWeather(SearchAutoComplete)  // Assuming you have a `SearchWeather` model
    case none
}

enum WeatherRequestType {
    
    case currentWeather(queryName: String)
    case searchWeather(queryName: String)
    
    var request: Request {
        switch self {
        case .currentWeather(let queryName):
            return WeatherRequests.getCurrentWeather(key: "425bdd722a88499995e43942232209", queryName: queryName, aqi: "yes")
        case .searchWeather(let queryName):
            return WeatherRequests.getSearchWeather(key: "425bdd722a88499995e43942232209", queryName: queryName)
        }
    }
}

class WeatherNetworkTask: Operation {
    
    typealias Output = WeatherResponse
    typealias RequestType = WeatherRequestType
    
    static let shared = WeatherNetworkTask()
    private init() {}
    
    func execute(in dispatcher: Dispatcher, for requestType: WeatherRequestType, completion: @escaping (WeatherResponse) -> Void) {
        
        let currentRequest = requestType.request
        
        dispatcher.execute(request: currentRequest) { response, error in
            guard let jsonData = response.jsonValue else {
                completion(.none)
                return
            }
            
            switch requestType {
            case .currentWeather:
                let currentWeather = CurrentWeather(json: jsonData)
                completion(.currentWeather(currentWeather))
            case .searchWeather:
                let searchAutoComplete = SearchAutoComplete.loadJSON(json: jsonData)
                completion(.searchWeather(searchAutoComplete))
            }
        }
    }
}
