//
//  FavoritesManager.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 10/6/25.
//
import Foundation

struct FavoriteAd: Codable, Identifiable, Equatable {
    let id: String
    let favoriteDate: String
}

protocol FavoritesManagerProtocol {
    func isFavorite(id: String) -> Bool
    func toggleFavorite(id: String)
    func favoritedDate(for id: String) -> String?
    func getAllFavorites() -> [FavoriteAd]
}

final class FavoritesManager: FavoritesManagerProtocol {
    static let shared = FavoritesManager()
    private let filename = "favorites.json"
    
    private var fileURL: URL {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("No se pudo obtener el documento directory")
        }
        return documentsURL.appendingPathComponent(filename)
    }
    
    private func loadFavorites() -> [FavoriteAd] {
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        return (try? JSONDecoder().decode([FavoriteAd].self, from: data)) ?? []
    }
    
    private func saveFavorites(_ favorites: [FavoriteAd]) {
        if let data = try? JSONEncoder().encode(favorites) {
            try? data.write(to: fileURL)
        }
    }
    
    func isFavorite(id: String) -> Bool {
        loadFavorites().contains { $0.id == id }
    }
    
    func toggleFavorite(id: String) {
        var favorites = loadFavorites()
        if let index = favorites.firstIndex(where: { $0.id == id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(FavoriteAd(id: id, favoriteDate: formattedDateString(date: Date.now)))
        }
        saveFavorites(favorites)
    }

    func favoritedDate(for id: String) -> String? {
        loadFavorites().first(where: { $0.id == id })?.favoriteDate
    }

    func getAllFavorites() -> [FavoriteAd] {
        loadFavorites()
    }

    func formattedDateString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
