//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import UIKit


class CharacterCollectionViewCell: UICollectionViewCell {
    
    
    static let id = "CharacterCollectionViewCell"
    
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private let containerForNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.image)
        self.contentView.addSubview(self.containerForNameView)
        self.containerForNameView.addSubview(self.nameLabel)
        self.addConstraints()
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.image.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor),
            self.image.leftAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leftAnchor),
            self.image.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.centerYAnchor, constant: 30.0),
            self.image.rightAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.rightAnchor),
            self.containerForNameView.topAnchor.constraint(equalTo: self.image.bottomAnchor),
            self.containerForNameView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.containerForNameView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.containerForNameView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.nameLabel.centerYAnchor.constraint(equalTo: self.containerForNameView.centerYAnchor),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.containerForNameView.centerXAnchor)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func configureCell(with image: String, name: String) {
        self.image.image = UIImage(named: image)
        self.nameLabel.text = name
    }
    
    
}
