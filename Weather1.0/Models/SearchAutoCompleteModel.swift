//
//  SearchWeatherModel.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/3/23.
//

import Foundation
import SwiftyJSON

struct SearchAutoComplete {
    var data: [AutoComplete]
    
    static func loadJSON(json: JSON) -> SearchAutoComplete {
        return SearchAutoComplete(data: AutoComplete.loadJSONArray(jsonArray: json.arrayValue))
    }
}

struct AutoComplete {
    var id: Int
    var name: String
    var region: String
    var country: String
    var lat: Float
    var lon: Float
    var url: String
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.region = json["region"].stringValue
        self.country = json["country"].stringValue
        self.lat = json["lat"].floatValue
        self.lon = json["lon"].floatValue
        self.url = json["url"].stringValue
    }
    
    static func loadJSONArray(jsonArray: [JSON]) -> [AutoComplete] {
        return jsonArray.map { AutoComplete(json: $0) }
    }
}

