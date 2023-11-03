//
//  ErrorMessages.swift
//  DailyNews
//
//  Created by Bahittin on 2.11.2023.
//

import Foundation

enum NewsErrors: String, Error {
    case success = "Success"
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "User is already favorited"
}
