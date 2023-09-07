//
//  SearchWeatherModel.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/3/23.
//

import Foundation
import SwiftyJSON

struct SearchAutoComplete {
    
    var data: [AutoComplete]!
    
    static func loadJSON(json: JSON) -> SearchAutoComplete {
        var searchAutoComplete = SearchAutoComplete()
        searchAutoComplete.data = AutoComplete.loadJSONArray(jsonArray: json.arrayValue)
        return searchAutoComplete
    }
    
}

struct AutoComplete {
    
    var id: Int!
    var name: String!
    var region: String!
    var country: String!
    var lat: Float!
    var lon: Float!
    var url: String!
    
    static func loadJSON(json: JSON) -> AutoComplete {
        var autocomplete = AutoComplete()
        autocomplete.id = json["id"].intValue
        autocomplete.name = json["name"].stringValue
        autocomplete.region = json["region"].stringValue
        autocomplete.country = json["country"].stringValue
        autocomplete.lat = json["lat"].floatValue
        autocomplete.lon = json["lon"].floatValue
        autocomplete.url = json["url"].stringValue
        return autocomplete
    }
    
    static func loadJSONArray(jsonArray: [JSON]) -> [AutoComplete] {
        var autoCompleteArray = [AutoComplete]()
        for json in jsonArray {
            var autoComplete = AutoComplete()
            autoComplete.id = json["id"].intValue
            autoComplete.name = json["name"].stringValue
            autoComplete.region = json["region"].stringValue
            autoComplete.country = json["country"].stringValue
            autoComplete.lat = json["lat"].floatValue
            autoComplete.lon = json["lon"].floatValue
            autoComplete.url = json["url"].stringValue
            autoCompleteArray.append(autoComplete)
        }
        return autoCompleteArray
    }
}
