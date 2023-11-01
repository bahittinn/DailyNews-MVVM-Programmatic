//
//  SearchController.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit

protocol SearchControllerInterface: AnyObject {
    func configure()
    func reloadTableView()
}

final class SearchController: UIViewController {
        
    //MARK: - Variables
    
    var viewModel = SearchViewModel()
    
    let searchBar: UISearchController = {
        let searchbar = UISearchController()
        return searchbar
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

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    
    //MARK: - UI Section
    private func configureNavigationBar() {
        /// LEFT BUTTONS
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(named: "menuicon"), target: self, action: nil)
        menuButton.tintColor = .label
        
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Search";
        
        navigationItem.leftBarButtonItems = [menuButton, UIBarButtonItem.init(customView: label)]
        
        /// RIGHT BUTTONS
        let bellButton = UIBarButtonItem(title: "Bell", image: UIImage(named: "bellicon"), target: self, action: nil)
        bellButton.tintColor = .label
        
        let searchButton = UIBarButtonItem(title: "Search", image: UIImage(named: "searchicon"), target: self, action: nil)
        searchButton.tintColor = .label
        
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
    }
    
    private func configureTableView() {
        view.addSubview(popularTableView)
        popularTableView.delegate   = self
        popularTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            popularTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            popularTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            popularTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            popularTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
//MARK: - Delegate & Datasource

extension SearchController: SearchControllerInterface {
    func configure() {
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search News"
        navigationItem.searchController = search
        
        configureTableView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.popularTableView.reloadData()
        }
    }
}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.popularNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularCell.reuseID, for: indexPath) as! PopularCell
        cell.configureUI()
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        
        let title = viewModel.popularNews[indexPath.row].title ??  ""
        let postedBY = viewModel.popularNews[indexPath.row].source?.name ?? "Bahittin"
        
        if let imageURL = URL(string: viewModel.popularNews[indexPath.row].urlToImage ?? "") {
            cell.makeCell(title: title, imageURL: imageURL, postedBy: postedBY)
        } else {
            cell.makeCell(title: title, imageURL: URL(string: Constants.null_image.rawValue)!, postedBy: postedBY)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = NewsDetailController()
        detailVC.viewModel.article = viewModel.popularNews[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.searchText = text
        viewModel.getPopularNews()
    }
}
