//
//  MainTabbarController.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setOpaque()
        createTabbar()
    }
 
    func createTabbar() {
        let vc = UINavigationController(rootViewController: HomeController())
        let vc2 = UINavigationController(rootViewController: SearchController())
        let vc3 = UINavigationController(rootViewController: SavedController())
        
        vc.tabBarItem.image  = UIImage(systemName: "house")
        vc.tabBarItem.title  = "Home"
        
        
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.tabBarItem.title  = "Search"
        
        vc3.tabBarItem.image = UIImage(systemName: "bookmark")
        vc3.tabBarItem.title  = "Saved"
        
        
        
        setViewControllers([vc, vc2, vc3], animated: true)
    
        UITabBar.appearance().tintColor = .black
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -220)
    }
    
    func setOpaque() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        // correct the transparency bug for Navigation bars
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }

}
