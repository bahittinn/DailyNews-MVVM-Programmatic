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
       
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController =  MainTabbarController()
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

