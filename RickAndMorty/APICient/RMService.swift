//
//  RMService.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


/// Primary API service to get data
final class RMService {
    
    
    /// Shared instance
    static let shared = RMService()
    
    
    /// Private constructor
    private init() {}
    
    
    /// Send API request
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: type we expect back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
    
    
}

