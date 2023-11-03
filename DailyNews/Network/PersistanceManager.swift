//
//  PersistanceManger.swift
//  DailyNews
//
//  Created by Bahittin on 2.11.2023.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}


enum PersistanceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let news = "News"
    }
    
    static func saveNews(news: Article) -> NewsErrors? {
        do {
            var newsArray = [Article]()
            retrieveFavorites { favorites in
                switch favorites {
                case .success(let articles):
                    if articles.isEmpty {
                        print("no data")
                    } else {
                        newsArray = articles
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            newsArray.append(news)
            let encoder = JSONEncoder()
            let encodedNews = try encoder.encode(newsArray)
            defaults.set(encodedNews, forKey: Keys.news)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    static func saveNews(news: [Article]) -> NewsErrors? {
        do {
            let encoder = JSONEncoder()
            let encodedNews = try encoder.encode(news)
            defaults.set(encodedNews, forKey: Keys.news)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    static func updateNews(news: Article) {
        retrieveFavorites { favorites in
            switch favorites {
            case .success(let articles):
                var retrievedFavorites = articles
                retrievedFavorites.removeAll { $0.title == news.title }
                saveNews(news: retrievedFavorites)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func retrieveFavorites(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.news) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Article].self, from: favoritesData)
            completion(.success(favorites))
        } catch {
            completion(.failure(error))
        }
    }
}
