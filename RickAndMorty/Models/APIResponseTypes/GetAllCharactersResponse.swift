//
//  GetCharacterResponse.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


struct GetAllCharactersResponse: Codable {
    let info: CharacterInfo
    let results: [Character]
}


struct CharacterInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

