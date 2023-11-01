//
//  NewsDetailController.swift
//  DailyNews
//
//  Created by Bahittin on 1.11.2023.
//

import UIKit

protocol NewsDetailInterface: AnyObject {
    func configureUI()
    func showArticle()
}

final class NewsDetailController: UIViewController {
    
    //MARK: - Variables
    
    var viewModel = NewsDetailViewModel()
    
    var detailNews: Article!
    
    let newsImageView = NewsImage(frame: .zero)
    let titleLabel    = TitleLabel()
    let myView        = CornerView()
    let newsFromLabel = SecondaryLabel()
    let readTimeLabel = SecondaryLabel()
    
    let padding: CGFloat  = 20
    let fontSize: CGFloat = 17
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

//MARK: - UI Section
extension NewsDetailController: NewsDetailInterface {
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureNewsImage()
        configureTitleLabel()
        configureFromLabelConstraints()
        configureReadTimeLabelConstraints()
        configureCornerView()
    }
    
    func showArticle() {
        DispatchQueue.main.async {
            self.titleLabel.text    = self.viewModel.article?.title
            self.newsFromLabel.text = self.viewModel.article?.source?.name
        }
    }
}

extension NewsDetailController {
    private func configureNewsImage() {
        view.addSubview(newsImageView)
        newsImageView.image = UIImage(named: "denemeimage")
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newsImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "deneme title label"
        titleLabel.configure(fontSize: fontSize)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureFromLabelConstraints() {
        view.addSubview(newsFromLabel)
        newsFromLabel.text = "By BBC News"
        newsFromLabel.configure(fontSize: 14)
        
        NSLayoutConstraint.activate([
            newsFromLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            newsFromLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        ])
    }
    
    func configureReadTimeLabelConstraints() {
        view.addSubview(readTimeLabel)
        readTimeLabel.text = "⚇ 1 min read"
        readTimeLabel.configure(fontSize: 14)
        
        NSLayoutConstraint.activate([
            readTimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            readTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func configureCornerView() {
        view.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: newsFromLabel.bottomAnchor,constant: 20),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            myView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureNavigationBar() {
        /// LEFT BUTTONS
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(named: "menuicon"), target: self, action: nil)
        menuButton.tintColor = .label
        
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "DETAIL";
        
        navigationItem.leftBarButtonItems = [menuButton, UIBarButtonItem.init(customView: label)]
        
        /// RIGHT BUTTONS
        let bellButton = UIBarButtonItem(title: "Bell", image: UIImage(named: "bellicon"), target: self, action: nil)
        bellButton.tintColor = .label
        
        let searchButton = UIBarButtonItem(title: "Search", image: UIImage(named: "searchicon"), target: self, action: #selector(showSearchScreen))
        searchButton.tintColor = .label
        
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
    }
    
    @objc func showSearchScreen() {
        let tabBarVC = self.tabBarController!
        tabBarVC.selectedIndex = 1
    }
}
