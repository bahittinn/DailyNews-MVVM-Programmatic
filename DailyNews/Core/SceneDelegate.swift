//
//  SceneDelegate.swift
//  DailyNews
//
//  Created by Bahittin on 30.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setOpaque()
       
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController =  createTabbar()
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    func createTabbar() -> UITabBarController {
        let vc = UINavigationController(rootViewController: HomeController())
        let vc2 = UINavigationController(rootViewController: SearchController())
        let vc3 = UINavigationController(rootViewController: SavedController())
        let vc4 = UINavigationController(rootViewController: ProfileController())
        
        vc.tabBarItem.image  = UIImage(systemName: "house")
        vc.tabBarItem.title  = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.tabBarItem.title  = "Search"
        
        vc3.tabBarItem.image = UIImage(systemName: "bookmark")
        vc3.tabBarItem.title  = "Saved"
        
        vc4.tabBarItem.image = UIImage(systemName: "person")
        vc4.tabBarItem.title  = "Profile"
        
        let tabbar = UITabBarController()
        tabbar.setViewControllers([vc, vc2, vc3, vc4], animated: true)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -220)
        return tabbar
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

