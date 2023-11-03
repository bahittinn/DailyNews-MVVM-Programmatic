//
//  NewsAlertVC.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

final class NewsAlertVC: UIViewController {
    
    private let denemeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius    = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("OK", for: .normal)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black.withAlphaComponent(0.75)
        configureContainerView()
        configureButton()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureButton() {
        containerView.addSubview(denemeButton)
        denemeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            denemeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            denemeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            denemeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            denemeButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
