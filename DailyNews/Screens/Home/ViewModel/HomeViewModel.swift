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
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
    }
    
    func getTrendingNews() {
        
    }
}
