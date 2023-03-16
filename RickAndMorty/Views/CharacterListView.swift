//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import UIKit


final class CharacterListView: UIView {
    
    
    private let viewModel = CharacterListViewViewModel()
    
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    
    /// View that shows list of characters, loader, etc.
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.configureLayout()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func configureLayout() {
        self.addSubview(self.spinner)
        
    
        let collectionView = self.configureCollectionView()
        self.addSubview(collectionView)

        
        NSLayoutConstraint.activate([
            self.spinner.widthAnchor.constraint(equalToConstant: 100.0),
            self.spinner.heightAnchor.constraint(equalToConstant: 100.0),
            self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    
    private func configureCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: self.generateCollectionViewLayout())
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    
    private func generateCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
    
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalWidth(0.7)
        )
        
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    
}


extension CharacterListView: UICollectionViewDelegate, UICollectionViewDataSource {

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.id,
                                                            for: indexPath) as? CharacterCollectionViewCell else { fatalError()}
        cell.configureCell(with: "bird.jpg", name: "Test")
        return cell
    }
    
    
}

