//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [URL]
    let url: String
    let created: String
}

