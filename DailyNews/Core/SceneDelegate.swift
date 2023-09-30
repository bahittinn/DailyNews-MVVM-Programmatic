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
        
        let vc = UINavigationController(rootViewController: HomeController())
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController =  vc
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

