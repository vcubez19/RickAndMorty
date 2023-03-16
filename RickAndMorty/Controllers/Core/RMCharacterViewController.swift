//
//  RMCharactersViewController.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import UIKit


final class RMCharactersViewController: UIViewController {
    
    
    private let characterListView = CharacterListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configureLayout()
    }
    
    
    private func configureLayout() {
        self.view.addSubview(self.characterListView)
        
        
        /// Constraints
        NSLayoutConstraint.activate([
            self.characterListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.characterListView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.characterListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.characterListView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }


}

