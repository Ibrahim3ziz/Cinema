//
//  MainTabBarViewController.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 17/05/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        let homeVC = UINavigationController(rootViewController: HomeRouter.initModule())
        let favoriteVC = UINavigationController(rootViewController: FavoriteViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        favoriteVC.tabBarItem.image = UIImage(systemName: "heart.fill")

        tabBar.backgroundColor = .systemBlue
        tabBar.tintColor = .white
        
        setViewControllers([homeVC, favoriteVC], animated: true)
    }


}
