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
    
    
    enum RMServiceError: Error {
        case badURL
        case requestError
        case nilData
        case badResponse
        case decodingError
    }
    
    
    /// Send API request
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: type we expect back
    ///   - completion: Callback with data or error
    func execute<T: Codable>(
        request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, RMServiceError>) -> Void
    ) {
        
        guard let url = request.url else {
            completion(.failure(.badURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
            error == nil else {
                completion(.failure((error != nil) ? .requestError : .nilData))
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(.badResponse))
                return
            }
            do {
                let object = try JSONDecoder().decode(type.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    
}

