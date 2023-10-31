//
//  SearchViewModel.swift
//  DailyNews
//
//  Created by Bahittin on 31.10.2023.
//

import Foundation

protocol SearchViewModelInterface {
    var view: SearchControllerInterface? { get set }
    
    func viewDidLoad()
    func getPopularNews()
}

final class SearchViewModel {
    weak var view: SearchControllerInterface?
    
    var popularNews:  [Article] = []
    var searchText = "Turkey"
}

extension SearchViewModel: SearchViewModelInterface {
    func viewDidLoad() {
        view?.configure()
        getPopularNews()
    }
    
    func getPopularNews() {
        var scText = searchText == "" ? "Turkey" : searchText
        
        NetworkManager.shared.fetchPopularNews(with: scText) { [weak self] response in
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
