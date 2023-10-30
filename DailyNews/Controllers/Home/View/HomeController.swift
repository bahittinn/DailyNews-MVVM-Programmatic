//
//  HomeController.swift
//  DailyNews
//
//  Created by Bahittin on 30.09.2023.
//

import UIKit

final class HomeController: UIViewController {
    
    //MARK: - Variables
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    private let trendingCollectionView: UICollectionView = {
        /// Layout Settings
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemWidth = UIScreen.main.bounds.size.width * 0.8
        layout.itemSize = CGSize(width: itemWidth, height: 250)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.reuseID)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureNavigationBar()
        configureContraints()
    }
    
    //MARK: - Constraints
    func configureContraints() {
        view.addSubview(trendingCollectionView)
        trendingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        trendingCollectionView.delegate   = self
        trendingCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            trendingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            trendingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            trendingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trendingCollectionView.heightAnchor.constraint(equalToConstant: 260)
        ])
    }
    
    //MARK: - Functions
    
    private func configureNavigationBar() {
        /// LEFT BUTTONS
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(named: "menuicon"), target: self, action: nil)
        menuButton.tintColor = .black
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = .boldSystemFont(ofSize: 18)
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

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.reuseID, for: indexPath) as! TrendingCell
        cell.configure()
        
        return cell
    }
}
