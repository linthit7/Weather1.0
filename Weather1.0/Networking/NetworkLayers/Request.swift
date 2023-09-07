//
//  Request.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 8/27/23.
//

import Foundation

// Define the type of data we expect as response

// - JSON: it's a json
// - Data: it's a plain data
public enum DataType {
    case JSON
    case Data
}

/* This is the Request protocol you may implement as enum
 or as a classic class object for each kind of requset.*/
public protocol Request {
    
    // Relative path of the endpoint we want to perform the call
    var path: String { get }
    
    // This define the HTTP method we should use to perform the call.
    // We have defined it inside a String base enum called 'HTTPMethod'.
    // just for clarity
    var method: HTTPMethod { get }
    
    // These are the parameters we need to send along with the call.
    // Params can be passed into the body or along with the URL
    var parameters: RequestParameters { get }
    
    // You may also define a list of headers to pass along with the request.
    var headers: [String: Any]? { get }
    
    // What kind of data we expect as response
    var dataType: DataType { get }
}

// This define the type of HTTP method used to perform the request.

// - post: POST method
// - put: PUT method
// - get: GET method
// - delete: DELETE method
// - patch: PATCH method
public enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

/* Define parameters to pass along with the request and
 how they are encapsulated into the http request itself. */

// - body: part of the body stream in the request
// - url: as url parameters
public enum RequestParameters {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}
