//
//  PersistanceManger.swift
//  DailyNews
//
//  Created by Bahittin on 2.11.2023.
//

import Foundation

enum PersistanceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let news = "News"
    }
    
    static func saveNews(news: [Article]) {
        do {
            let encoder = JSONEncoder()
            let encodedNews = try encoder.encode(news)
            defaults.set(encodedNews, forKey: Keys.news)
            
        } catch {
            
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
