//
//  NewsDetailViewModel.swift
//  DailyNews
//
//  Created by Bahittin on 1.11.2023.
//

import Foundation

protocol NewsDetailViewModelInterface {
    var view: NewsDetailInterface? { get set }
    func viewDidLoad()
}

class NewsDetailViewModel {
    weak var view: NewsDetailInterface?
    
    var article: Article?
}

extension NewsDetailViewModel: NewsDetailViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
        view?.showArticle()
    }
}
