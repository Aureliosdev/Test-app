//
//  ViewController.swift
//  Call and Messages
//
//  Created by Aurelio Le Clarke on 14.09.2022.
//

import UIKit

class MainTabBar: UITabBarController {

    private func setupControllers() {
        
        let nav1 = UINavigationController(rootViewController: CallsViewController())
        let nav2 = UINavigationController(rootViewController: MessageViewController())
        let nav3 = UINavigationController(rootViewController: ProfileViewController())
        
        nav1.tabBarItem.image = UIImage(systemName: "phone.circle")
        nav2.tabBarItem.image = UIImage(systemName: "message.circle")
        nav3.tabBarItem.image = UIImage(systemName: "person.circle")
        
        nav1.title = "Calls"
        nav2.title = "Messages"
        nav3.title = "Profile"
        
        tabBar.tintColor = .label
        setViewControllers([nav1,nav2,nav3], animated: true)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }


}

