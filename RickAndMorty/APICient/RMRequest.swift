//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


/// Object that represents single API call
/// Makes a URL
final class RMRequest {
    
    
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    
    /// URL components
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    
    private var urlString: String {
        var urlString = "\(Constants.baseURL)/\(endpoint.rawValue)"
        if !pathComponents.isEmpty {
            pathComponents.forEach({ urlString += "/\($0)" })
        }
        if !queryParameters.isEmpty {
            urlString += "?"
            let argumentString = queryParameters.compactMap { item in
                guard let value = item.value else { return nil }
                return "\(item.name)=\(value)"
            }.joined(separator: "&")
            urlString += argumentString
        }
        return urlString
    }
    
    
    /// The final URL of a request
    public var url: URL? {
        return URL(string: urlString)
    }
    
    
    /// HTTP GET
    let httpMethod = "GET"
    
    
    init(endpoint: RMEndpoint, pathComponents: [String], queryParameters: [URLQueryItem]) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
}


extension RMRequest {
    static let characterRequest = RMRequest(endpoint: .character, pathComponents: [], queryParameters: [])
    static let locationRequest = RMRequest(endpoint: .location, pathComponents: [], queryParameters: [])
    static let episodeRequest = RMRequest(endpoint: .episode, pathComponents: [], queryParameters: [])
}

