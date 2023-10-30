//
//  HomeController.swift
//  DailyNews
//
//  Created by Bahittin on 30.09.2023.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Home"
        
        /// LEFT BUTTONS
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(named: "menuicon"), target: self, action: nil)
        menuButton.tintColor = .black
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = .boldSystemFont(ofSize: 17)
        label.text = "NEWS";
        
        navigationItem.leftBarButtonItems = [menuButton, UIBarButtonItem.init(customView: label)]
        
        /// RIGHT BUTTONS
        let bellButton = UIBarButtonItem(title: "Bell", image: UIImage(named: "bellicon"), target: self, action: nil)
        bellButton.tintColor = .black
        
        let searchButton = UIBarButtonItem(title: "Search", image: UIImage(named: "searchicon"), target: self, action: nil)
        searchButton.tintColor = .black
                
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
        
    }
}
