//
//  NewsAlertVC.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

class NewsAlertVC: UIViewController {
    
    private let denemeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Deneme", for: .normal)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black.withAlphaComponent(0.75)
        configureButton()
    }
    
    func configureButton() {
        view.addSubview(denemeButton)
        denemeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            denemeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            denemeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            denemeButton.widthAnchor.constraint(equalToConstant: 100),
            denemeButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
