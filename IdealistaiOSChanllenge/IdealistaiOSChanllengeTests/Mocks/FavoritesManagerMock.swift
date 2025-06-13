//
//  FavoritesManagerMock.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//

import XCTest
@testable import IdealistaiOSChanllenge

class FavoritesManagerMock: FavoritesManagerProtocol {
    
    var toogleCount = 0
    var isFavorite = false
    var dateString = "11/02/1998"

    func isFavorite(id: String) -> Bool {
        return isFavorite
    }
    
    func toggleFavorite(id: String) {
        toogleCount += 1
    }
    
    func favoritedDate(for id: String) -> String? {
        return dateString
    }
    
    func getAllFavorites() -> [FavoriteAd] {
        return [FavoriteAd(id: "1",
                          favoriteDate: "11/02/1998")]
    }
}
