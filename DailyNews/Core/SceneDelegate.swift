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
        let vc2 = UINavigationController(rootViewController: ViewController())
        
        vc.tabBarItem.image  = UIImage(systemName: "bell")
        vc.tabBarItem.title  = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "bell")
        vc2.tabBarItem.title  = "Feed"
        
        let tabbar = UITabBarController()
        tabbar.setViewControllers([vc, vc2], animated: true)
        
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

