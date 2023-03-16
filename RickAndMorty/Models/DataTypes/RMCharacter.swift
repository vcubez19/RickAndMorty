//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


struct Character: Codable {
    let id: Int
    let name: String
    let status: Status.RawValue
    let species: String
    let type: String
    let gender: Gender.RawValue
    let origin: Origin
    let location: SingleLocation
    let image: String
    let episode: [URL]
    let url: String
    let created: String
}


/// A character's status. There are only 3 possible values: alive, dead, or unknown.
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "Unknown"
}


/// A character's gender. There are only 4 possible values: male, female, genderless, or unknown.
enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case `unknown` = "Unknown"
}

