//
//  CurrentWeatherModel.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/2/23.
//

import Foundation
import SwiftyJSON

struct CurrentWeather {
    var location: Location!
    var current: Current!
    
    static func loadJSON(json: JSON) -> CurrentWeather {

        var currentWeather = CurrentWeather()
        currentWeather.location = Location.loadJSON(json: json["location"])
        currentWeather.current = Current.loadJSON(json: json["current"])
        return currentWeather
    }
}

struct Location {
    var name: String!
    var region: String!
    var country: String!
    var lat: Float!
    var lon: Float!
    var tz_id: String!
    var localtime_epoch: Int!
    var localtime: String!
    
    static func loadJSON(json: JSON) -> Location {
        var location = Location()
        location.name = json["name"].stringValue
        location.region = json["region"].stringValue
        location.country = json["country"].stringValue
        location.lat = json["lat"].floatValue
        location.lon = json["lon"].floatValue
        location.tz_id = json["tz_id"].stringValue
        location.localtime_epoch = json["localtime_epoch"].intValue
        location.localtime = json["localtime"].stringValue
        return location
    }
}

struct Current {
    var last_update_epoch: Int!
    var last_updated: String!
    var temp_c: Float!
    var temp_f: Float!
    var is_day: Int!
    var condition: Condition!
    var wind_mph: Float!
    var wind_kph: Float!
    var wind_degree: Int!
    var wind_dir: String!
    var pressure_mb: Float!
    var pressure_in: Float!
    var precip_mm: Float!
    var precip_in: Float!
    var humidity: Int!
    var cloud: Int!
    var feelslike_c: Float!
    var feelslike_f: Float!
    var vis_km: Float!
    var vis_miles: Float!
    var uv: Float!
    var gust_mph: Float!
    var gust_kph: Float!
    var air_quality: AirQuality!
    
    static func loadJSON(json: JSON) -> Current {
        var current = Current()
        current.last_update_epoch = json["last_updated_epoch"].intValue
        current.last_updated = json["last_updated"].stringValue
        current.temp_c = json["temp_c"].floatValue
        current.temp_f = json["temp_f"].floatValue
        current.is_day = json["is_day"].intValue
        current.condition = Condition.loadJSON(json: json["condition"])
        current.wind_mph = json["wind_mph"].floatValue
        current.wind_kph = json["wind_kph"].floatValue
        current.wind_degree = json["wind_degree"].intValue
        current.wind_dir = json["wind_dir"].stringValue
        current.pressure_mb = json["pressure_mb"].floatValue
        current.pressure_in = json["pressure_in"].floatValue
        current.precip_mm = json["precip_mm"].floatValue
        current.precip_in = json["precip_in"].floatValue
        current.humidity = json["humidity"].intValue
        current.cloud = json["cloud"].intValue
        current.feelslike_c = json["feelslike_c"].floatValue
        current.feelslike_f = json["feelslike_f"].floatValue
        current.vis_km = json["vis_km"].floatValue
        current.vis_miles = json["vis_miles"].floatValue
        current.uv = json["uv"].floatValue
        current.gust_mph = json["gust_mph"].floatValue
        current.gust_kph = json["gust_kph"].floatValue
        current.air_quality = AirQuality.loadJSON(json: json["air_quality"])
        return current
    }
}

struct Condition {
    var text: String!
    var icon: String!
    var code: Int!
    
    static func loadJSON(json: JSON) -> Condition {
        var condition = Condition()
        condition.text = json["text"].stringValue
        condition.icon = json["icon"].stringValue
        condition.code = json["code"].intValue
        return condition
    }
}

struct AirQuality {
    var co: Float!
    var no2: Float!
    var o3: Float!
    var so2: Float!
    var pm2_5: Float!
    var pm10: Float!
    
    static func loadJSON(json: JSON) -> AirQuality {
        var airQuailty = AirQuality()
        airQuailty.co = json["co"].floatValue
        airQuailty.no2 = json["no2"].floatValue
        airQuailty.o3 = json["o3"].floatValue
        airQuailty.so2 = json["so2"].floatValue
        airQuailty.pm2_5 = json["pm2_5"].floatValue
        airQuailty.pm10 = json["pm10"].floatValue
        return airQuailty
    }
}

