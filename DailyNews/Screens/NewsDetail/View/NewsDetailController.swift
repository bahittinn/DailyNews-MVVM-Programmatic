//
//  NewsDetailController.swift
//  DailyNews
//
//  Created by Bahittin on 1.11.2023.
//

import UIKit

protocol NewsDetailInterface {
    func configureUI()
}

class NewsDetailController: UIViewController {
    
    //MARK: - Variables
    let newsImageView = NewsImage(frame: .zero)
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    
    
}
//MARK: - UI Section
extension NewsDetailController: NewsDetailInterface {
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureNewsImage()
        configureCornerView()
    }
    
    func configureNewsImage() {
        view.addSubview(newsImageView)
        newsImageView.image = UIImage(named: "denemeimage")
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newsImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureCornerView() {
        let myView = CornerView()
        view.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.6)
        ])
    }
}
