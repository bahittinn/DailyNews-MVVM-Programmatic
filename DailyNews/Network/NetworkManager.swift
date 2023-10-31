//
//  NetworkManager.swift
//  DailyNews
//
//  Created by Bahittin on 30.10.2023.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchTrendingNews(completion: @escaping (Result<[Article], Error>) -> ()) {
        guard let url = URL(string: "\(Constants.Trending_Url.rawValue)\(Constants.Api_Key.rawValue)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(Trending.self, from: data)
                completion(.success(decodedData.articles ?? []))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetchPopularNews(completion: @escaping (Result<[Article], Error>) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=bf5ad777c9364b59b25d4e2142be2ebf") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(Trending.self, from: data)
                completion(.success(decodedData.articles ?? []))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}