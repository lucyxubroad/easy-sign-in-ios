//
//  EventsTabBarViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class EventsTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        tabBar.barTintColor = .white
        
        setupTabBar()

    }
    
    func setupTabBar() {
        
        let videoController = createNavController(vc: VideoViewController(), selected: #imageLiteral(resourceName: "video_white"), unselected: #imageLiteral(resourceName: "video_black"))
        let favoriteController = createNavController(vc: FavoritesViewController(), selected: #imageLiteral(resourceName: "star_white"), unselected: #imageLiteral(resourceName: "star_black"))
        
        viewControllers = [videoController, favoriteController]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }

}

extension UITabBarController {
    
    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        return navController
    }
}
