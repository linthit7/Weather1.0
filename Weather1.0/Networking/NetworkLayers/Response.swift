//
//  Response.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/1/23.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum Response {
    case json(_: JSON)
    case data(_: Data)
    case error(_: Int?, _: Error?)

    init(response: DataResponse<Data, AFError>, for request: Request) {
        guard let statusCode = response.response?.statusCode, statusCode == 200, response.error == nil else {
            self = .error(response.response?.statusCode, response.error)
            return
        }

        guard let data = response.data else {
            self = .error(response.response?.statusCode, NetworkErrors.noData)
            return
        }

        switch request.dataType {
        case .Data:
            self = .data(data)
        case .JSON:
            self = .json(JSON(data))
        }
    }
    
    var jsonValue: JSON? {
            switch self {
            case .json(let json):
                return json
            default:
                return nil
            }
        }
}


