//
//  WeatherNetworkTask.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/2/23.
//

import Foundation
import SwiftyJSON

enum WeatherRequestType {
    
    case currentWeather
    case searchWeather
    
    var request: Request {
        switch self {
        case .currentWeather:
            return WeatherRequests.getCurrentWeather(key: "b2db213b1a3e4f4da04141533230709", queryName: "Yangon", aqi: "yes")
        case .searchWeather:
            return WeatherRequests.getSearchWeather(key: "b2db213b1a3e4f4da04141533230709", queryName: "Yangon")
        }
    }
}

class WeatherNetworkTask: Operation {
    
    typealias Output = CurrentWeather
    typealias RequestType = WeatherRequestType
    
    static let shared = WeatherNetworkTask()
    private init() {}
    
    func execute(in dispatcher: Dispatcher, for requestType: WeatherRequestType, completion: @escaping (CurrentWeather?) -> Void) {
        
        let currentRequest = requestType.request
        
        dispatcher.execute(request: currentRequest) { response, error in

            let cw = CurrentWeather.loadJSON(json: response.jsonValue!)
            completion(cw)
        }
    }
}
