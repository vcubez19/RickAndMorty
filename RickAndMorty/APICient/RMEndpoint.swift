//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


/// API endpoint
@frozen enum RMEndpoint: String {
    case character = "character"
    case location = "location"
    case episode = "episode"
}

