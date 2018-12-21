//
//  MainTabController.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/6/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = setupViewControllers()
        
    }
    
    func setupViewControllers() -> [UINavigationController] {
        
        let countDownNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: CountDownDemoController())
        
        let pulsatingHeartVCNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: PulsatingHeartVC())
        
        let circularBarVC = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: CircularBarVC())
        
        return [countDownNavController, pulsatingHeartVCNavController, circularBarVC]
    }
    
    func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = self.view.frame.size.height / 9
        tabFrame.origin.y = self.view.frame.size.height - 75
        self.tabBar.frame = tabFrame
    }
    
}


