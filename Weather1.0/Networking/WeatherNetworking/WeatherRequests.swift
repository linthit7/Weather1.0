//
//  WeatherRequests.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 8/27/23.
//

import Foundation

public enum WeatherRequests: Request {    

    case getCurrentWeather(key: String, queryName: String, aqi: String)
    case getSearchWeather(key: String, queryName: String)
    
    public var path: String {
        switch self {
        case .getCurrentWeather(_,_,_):
            return "/current.json"
        case .getSearchWeather(_,_):
            return"/search.json"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getCurrentWeather(_,_,_):
            return .get
        case .getSearchWeather(_,_):
            return .get
        }
    }
    
    public var parameters: RequestParameters {
        switch self {
        case .getCurrentWeather(let key, let queryName, let aqi):
            return .url(["key": key, "q": queryName, "aqi": aqi])
        case .getSearchWeather(let key, let queryName):
            return .url(["key": key, "q": queryName])
        }
    }
    
    public var headers: [String : Any]? {
        switch self {
        default: return nil
        }
    }
    
    public var dataType: DataType {
        switch self {
        case .getCurrentWeather(_,_,_):
            return .JSON
        case .getSearchWeather(_,_):
            return .JSON
        }
    }
    
}
