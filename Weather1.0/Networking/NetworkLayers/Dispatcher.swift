//
//  Dispatcher.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 8/28/23.
//

import Foundation
import Alamofire

// The dispatcher is responsible to execute a Request
// by calling the underlying layer (maybe URLSession, Alamofire)
// or just a fake dispatcher which return mocked results.
// As output for a Request it should provide a Response.
public protocol Dispatcher {
    
    // Configure the dispatcher with an environment
    // - Parameter environment: environment configuration
    init(environment: Environment)
    
    // This function execute the request and provide a Promise
    // with the response
    
    // - Parameter request: request to execute
    // - Return: ((Result<DataType, AFError>)->Void)
    func execute(request: Request, completion: @escaping (Response, NetworkErrors) -> Void)
}
