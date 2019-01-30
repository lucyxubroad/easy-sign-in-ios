//
//  EventsTabBarViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class EventsTabBarViewController: UITabBarController {
    
    var userInformation: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        tabBar.barTintColor = .white
        
        setupTabBar()

    }
    
    func setupTabBar() {
        
        let nearbyEventsController = createNavController(vc: NearbyEventsViewController(), selected: #imageLiteral(resourceName: "calendar-filled"), unselected: #imageLiteral(resourceName: "calendar-unfilled"))
        let myEventsController = createNavController(vc: MyEventsViewController(), selected: #imageLiteral(resourceName: "invite-filled"), unselected: #imageLiteral(resourceName: "invite-unfilled"))
        
        viewControllers = [nearbyEventsController, myEventsController]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
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
