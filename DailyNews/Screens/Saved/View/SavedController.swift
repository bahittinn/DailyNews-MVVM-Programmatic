//
//  SavedController.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import UIKit

protocol SavedControllerInterface: AnyObject {
    func configureUI()
    func reloadTableView()
}

class SavedController: UIViewController {

     //MARK: - Variables
    var viewModel = SavedViewModel()
    
    
    private let savedTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PopularCell.self, forCellReuseIdentifier: PopularCell.reuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }
    
    //MARK: - UI Section

    private func configureNavigationBar() {
        /// LEFT BUTTONS
        let menuButton = UIBarButtonItem(title: "Menu", image: UIImage(named: "menuicon"), target: self, action: nil)
        menuButton.tintColor = .label
        
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "SAVED";
        
        navigationItem.leftBarButtonItems = [menuButton, UIBarButtonItem.init(customView: label)]
        
        /// RIGHT BUTTONS
        let bellButton = UIBarButtonItem(title: "Bell", image: UIImage(named: "bellicon"), target: self, action: nil)
        bellButton.tintColor = .label
        
        let searchButton = UIBarButtonItem(title: "Search", image: UIImage(named: "searchicon"), target: self, action: nil)
        searchButton.tintColor = .label
        
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
    }
    
    private func configureTableView() {
        view.addSubview(savedTableView)
        savedTableView.delegate   = self
        savedTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            savedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            savedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            savedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            savedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SavedController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularCell.reuseID, for: indexPath) as! PopularCell
        cell.configureUI()
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        
        let title = viewModel.favoriteNews[indexPath.row].title ??  ""
        let postedBY = viewModel.favoriteNews[indexPath.row].source?.name ?? "Bahittin"
        
        if let imageURL = URL(string: viewModel.favoriteNews[indexPath.row].urlToImage ?? "") {
            cell.makeCell(title: title, imageURL: imageURL, postedBy: postedBY)
        } else {
            cell.makeCell(title: title, imageURL: URL(string: Constants.null_image.rawValue)!, postedBy: postedBY)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = NewsDetailController()
        detailVC.viewModel.article = viewModel.favoriteNews[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let news = viewModel.favoriteNews[indexPath.row]
        viewModel.favoriteNews.remove(at: indexPath.row)
        savedTableView.deleteRows(at: [indexPath], with: .left)
        
        PersistanceManager.updateNews(news: news)
        viewModel.getSavedNews()
        showAlertMainThread(with: "You have successfully delete this news from saved news")
    }
}


//MARK: - Delegate & Datasource
extension SavedController: SavedControllerInterface {
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureTableView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.savedTableView.reloadData()
        }
    }
}
