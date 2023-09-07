//
//  WeatherNetworkDispatcher.swift
//  Weather1.0
//
//  Created by Lin Thit Khant on 9/1/23.
//

import Foundation
import Alamofire

public enum NetworkErrors: Error {
    case badInput
    case noData
    case unknownParameterType
    case requestFailed
    case none
}

public class WeatherNetworkDispatcher: Dispatcher {
    
    private var environment: Environment
    
    public required init(environment: Environment) {
        self.environment = environment
    }
    
    public func execute(request: Request, completion: @escaping (Response, NetworkErrors) -> Void) {
        do {
            let finalRequest = try self.prepareURLRequest(for: request)
            
            AF.request(finalRequest).responseData(queue: .global(qos: .background)) { alamofireResponse in

                let customResponse = Response(response: alamofireResponse, for: request)
                // Check the error from Alamofire
                if let _ = alamofireResponse.error {
                    // Here you can map Alamofire errors to your custom NetworkErrors.
                    // For now, let's assume you have a generic .requestFailed in NetworkErrors
                    completion(customResponse, .requestFailed)
                } else {
                    // If there's no error, you might want to use a custom "success" error or none at all.
                    // Here we use .none for illustration purposes.
                    completion(customResponse, .none) // Adjust based on your NetworkErrors enum
                }
            }
            
        } catch {
            // Handle the error from prepareURLRequest function
            completion(.error(nil, nil), .badInput) // Assuming .badInput is an error type in NetworkErrors
        }
        
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        // Compose the url
        let full_url = "\(environment.host)\(request.path)"
        
        guard let url = URL(string: full_url) else {
            throw NetworkErrors.badInput
        }
        
        var urlRequest = URLRequest(url: url)
        
        // Setup HTTP method
        urlRequest.httpMethod = request.method.rawValue
        
        // Working with parameters
        switch request.parameters {
        case .body(let params):
            // Parameters are part of the body
            if let params = params as? [String: String] {
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
            } else {
                throw NetworkErrors.badInput
            }
        case .url(let params):
            // Parameters are part of the url
            if let params = params as? [String: String] {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            } else {
                throw NetworkErrors.badInput
            }
        }
        
        // Add headers from environment and request
        environment.headers.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
}
