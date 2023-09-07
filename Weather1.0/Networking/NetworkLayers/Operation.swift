//
//  Operation.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/2/23.
//

import Foundation

protocol Operation {
    associatedtype Output
    associatedtype RequestType
    
    /// Execute request in passed dispatcher
    ///
    /// - Parameter dispatcher: dispatcher
    /// - Returns: a promise
    func execute(in dispatcher: Dispatcher, for request: RequestType, completion: @escaping (Output?) -> Void)
    
}
