//
//  HomeViewModel.swift
//  DailyNews
//
//  Created by Bahittin on 31.10.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeControllerInterface? { get set }
    func viewDidLoad()
    func getTrendingNews()
}

final class HomeViewModel {
    weak var view: HomeControllerInterface?
    
    var trendingNews: [Article] = []
    var popularNews:  [Article] = []
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
        getTrendingNews()
        getPopularNews()
    }
    
    func getTrendingNews() {
        NetworkManager.shared.fetchTrendingNews { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let news):
                self.trendingNews = news
                self.view?.reloadCollectionView()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPopularNews() {
        NetworkManager.shared.fetchPopularNews { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let news):
                self.popularNews = news
                self.view?.reloadTableView()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
