//
//  CurrentWeatherModel.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/2/23.
//

import Foundation
import SwiftyJSON

struct CurrentWeather {
    var location: Location
    var current: Current
    
    init(json: JSON) {
        self.location = Location(json: json["location"])
        self.current = Current(json: json["current"])
    }
}

struct Location {
    var name: String
    var region: String
    var country: String
    var lat: Float
    var lon: Float
    var tz_id: String
    var localtime_epoch: Int
    var localtime: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.region = json["region"].stringValue
        self.country = json["country"].stringValue
        self.lat = json["lat"].floatValue
        self.lon = json["lon"].floatValue
        self.tz_id = json["tz_id"].stringValue
        self.localtime_epoch = json["localtime_epoch"].intValue
        self.localtime = json["localtime"].stringValue
    }
}

struct Current {
    var last_update_epoch: Int
    var last_updated: String
    var temp_c: Float
    var temp_f: Float
    var is_day: Int
    var condition: Condition
    var wind_mph: Float
    var wind_kph: Float
    var wind_degree: Int
    var wind_dir: String
    var pressure_mb: Float
    var pressure_in: Float
    var precip_mm: Float
    var precip_in: Float
    var humidity: Int
    var cloud: Int
    var feelslike_c: Float
    var feelslike_f: Float
    var vis_km: Float
    var vis_miles: Float
    var uv: Float
    var gust_mph: Float
    var gust_kph: Float
    var air_quality: AirQuality
    
    init(json: JSON) {
        self.last_update_epoch = json["last_updated_epoch"].intValue
        self.last_updated = json["last_updated"].stringValue
        self.temp_c = json["temp_c"].floatValue
        self.temp_f = json["temp_f"].floatValue
        self.is_day = json["is_day"].intValue
        self.condition = Condition(json: json["condition"])
        self.wind_mph = json["wind_mph"].floatValue
        self.wind_kph = json["wind_kph"].floatValue
        self.wind_degree = json["wind_degree"].intValue
        self.wind_dir = json["wind_dir"].stringValue
        self.pressure_mb = json["pressure_mb"].floatValue
        self.pressure_in = json["pressure_in"].floatValue
        self.precip_mm = json["precip_mm"].floatValue
        self.precip_in = json["precip_in"].floatValue
        self.humidity = json["humidity"].intValue
        self.cloud = json["cloud"].intValue
        self.feelslike_c = json["feelslike_c"].floatValue
        self.feelslike_f = json["feelslike_f"].floatValue
        self.vis_km = json["vis_km"].floatValue
        self.vis_miles = json["vis_miles"].floatValue
        self.uv = json["uv"].floatValue
        self.gust_mph = json["gust_mph"].floatValue
        self.gust_kph = json["gust_kph"].floatValue
        self.air_quality = AirQuality(json: json["air_quality"])
    }
}

struct Condition {
    var text: String
    var icon: String
    var code: Int
    
    init(json: JSON) {
        self.text = json["text"].stringValue
        self.icon = json["icon"].stringValue
        self.code = json["code"].intValue
    }
}

struct AirQuality {
    var co: Float
    var no2: Float
    var o3: Float
    var so2: Float
    var pm2_5: Float
    var pm10: Float
    
    init(json: JSON) {
        self.co = json["co"].floatValue
        self.no2 = json["no2"].floatValue
        self.o3 = json["o3"].floatValue
        self.so2 = json["so2"].floatValue
        self.pm2_5 = json["pm2_5"].floatValue
        self.pm10 = json["pm10"].floatValue
    }
}

