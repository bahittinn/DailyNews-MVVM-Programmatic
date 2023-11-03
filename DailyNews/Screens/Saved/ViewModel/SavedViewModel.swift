//
//  SavedViewModel.swift
//  DailyNews
//
//  Created by Bahittin on 2.11.2023.
//

import Foundation

protocol SavedViewModelInterface {
    var view: SavedControllerInterface? { get set }
    func viewDidLoad()
    func viewWillAppear()
    func getSavedNews()
}

class SavedViewModel {
    weak var view: SavedControllerInterface?
    
    var favoriteNews: [Article] = []
}

extension SavedViewModel: SavedViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
    }
    func viewWillAppear() {
        getSavedNews()
    }
    
    func getSavedNews() {
        PersistanceManager.retrieveFavorites { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let favorites):
                if favorites.isEmpty {
                    print("no favorites")
                } else {
                    self.favoriteNews  = favorites
                    self.view?.reloadTableView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
}
