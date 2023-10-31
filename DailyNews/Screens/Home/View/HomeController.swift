//
//  HomeController.swift
//  DailyNews
//
//  Created by Bahittin on 30.09.2023.
//

import UIKit

protocol HomeControllerInterface: AnyObject {
    func configureUI()
    func reloadCollectionView()
}

final class HomeController: UIViewController {
    
    //MARK: - Variables
    
    private let viewModel = HomeViewModel()
    
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
    
    private let popularTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PopularCell.self, forCellReuseIdentifier: PopularCell.reuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let populerNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular News"
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Show More"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    //MARK: - Constraints
    
    func configureContraints() {
        configureCollectionView()
        configurePopularNewsLabelConstraints()
        configureShowMoreLabelConstraints()
        configureTableView()
    }
    
    func configureCollectionView() {
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
    
    private func configurePopularNewsLabelConstraints() {
        view.addSubview(populerNewsLabel)
        
        NSLayoutConstraint.activate([
            populerNewsLabel.topAnchor.constraint(equalTo: trendingCollectionView.bottomAnchor, constant: 10),
            populerNewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            populerNewsLabel.widthAnchor.constraint(equalToConstant: 150),
            populerNewsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureShowMoreLabelConstraints() {
        view.addSubview(showMoreLabel)
        
        NSLayoutConstraint.activate([
            showMoreLabel.topAnchor.constraint(equalTo: populerNewsLabel.topAnchor),
            showMoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            showMoreLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureTableView() {
        view.addSubview(popularTableView)
        popularTableView.delegate   = self
        popularTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            popularTableView.topAnchor.constraint(equalTo: populerNewsLabel.bottomAnchor),
            popularTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            popularTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            popularTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
    //MARK: - Functions
    
    private func configureNavigationBar() {
        /// LEFT BUTTONS
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(named: "menuicon"), target: self, action: nil)
        menuButton.tintColor = .label
        
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "NEWS";
        
        navigationItem.leftBarButtonItems = [menuButton, UIBarButtonItem.init(customView: label)]
        
        /// RIGHT BUTTONS
        let bellButton = UIBarButtonItem(title: "Bell", image: UIImage(named: "bellicon"), target: self, action: nil)
        bellButton.tintColor = .label
        
        let searchButton = UIBarButtonItem(title: "Search", image: UIImage(named: "searchicon"), target: self, action: nil)
        searchButton.tintColor = .label
        
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
    }
}

//MARK: - Datasource & Deletage

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.trendingNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.reuseID, for: indexPath) as! TrendingCell
        if let imageURL = URL(string: viewModel.trendingNews[indexPath.row].urlToImage ?? "") {
            let title = viewModel.trendingNews[indexPath.row].title ??  ""
            cell.makeCell(with: title, imageURL: imageURL)
        }
        return cell
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.trendingNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularCell.reuseID, for: indexPath) as! PopularCell
        cell.configureUI()
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        
        
        
        if let imageURL = URL(string: viewModel.trendingNews[indexPath.row].urlToImage ?? "") {
            let title = viewModel.trendingNews[indexPath.row].title ??  ""
            let postedBY = viewModel.trendingNews[indexPath.row].source?.name ?? "Bahittin"
            cell.makeCell(title: title, imageURL: imageURL, postedBy: postedBY)
        }
        
        
        return cell
    }
}

extension HomeController: HomeControllerInterface {
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        configureNavigationBar()
        configureContraints()
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.trendingCollectionView.reloadData()
            self.popularTableView.reloadData()
        }
    }
}
