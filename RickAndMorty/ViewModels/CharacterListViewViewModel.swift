//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import Foundation


struct CharacterListViewViewModel {
    
    
    func fetchCharacters() {
        RMService.shared.execute(
            request: .characterRequest,
            expecting: GetAllCharactersResponse.self) { result in
                switch result {
                case .failure(_):
                    print("Error")
                case .success(let response):
                    print(response.results)
                }
            }
    }
    
    
}

