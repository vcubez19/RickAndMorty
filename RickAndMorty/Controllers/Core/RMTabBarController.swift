//
//  RMTabBarController.swift
//  RickAndMorty
//
//  Created by Vincent Cubit on 3/15/23.
//


import UIKit


final class RMTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabs()
    }
    
    
    private func setUpTabs() {
        // Controllers
        let characterVC = UINavigationController(rootViewController: RMCharactersViewController())
        let locationsVC = UINavigationController(rootViewController: RMLocationsViewController())
        let episodesVC = UINavigationController(rootViewController: RMEpisodesViewController())
        let settingsVC = UINavigationController(rootViewController: RMSettingsViewController())
        
        
        // Configure tab bar items
        characterVC.tabBarItem = UITabBarItem(title: nil,
              image: UIImage(systemName: "person"),
              selectedImage: UIImage(systemName: "person.fill")
        )
        locationsVC.tabBarItem = UITabBarItem(title: nil,
              image: UIImage(systemName: "location"),
              selectedImage: UIImage(systemName: "location.fill")
        )
        episodesVC.tabBarItem = UITabBarItem(title: nil,
              image: UIImage(systemName: "book"),
              selectedImage: UIImage(systemName: "book.fill")
        )
        settingsVC.tabBarItem = UITabBarItem(title: nil,
              image: UIImage(systemName: "gearshape"),
              selectedImage: UIImage(systemName: "gearshape.fill")
        )
        
        
        self.tabBar.tintColor = .label
        // Set controllers
        self.setViewControllers([characterVC, locationsVC, episodesVC, settingsVC], animated: true)
    }
    
    
}

