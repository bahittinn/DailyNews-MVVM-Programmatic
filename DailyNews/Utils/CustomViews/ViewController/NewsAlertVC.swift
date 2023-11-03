//
//  NewsAlertVC.swift
//  DailyNews
//
//  Created by Bahittin on 3.11.2023.
//

import UIKit

final class NewsAlertVC: UIViewController {
    
    //MARK: -  Variables
    private let titleLabel    = TitleLabel()
    private let closeButton   = NewsButton()
    private let containerView = NewsContainerView()
    
    var alertTitle: String?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black.withAlphaComponent(0.75)
        configureContainerView()
        configureTitleLabel()
        configureButton()
    }
    
    init(alertTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = alertTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    
    private func configureContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text =  alertTitle ?? "Error"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureButton() {
        containerView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            closeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    //MARK: - Selectors
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
