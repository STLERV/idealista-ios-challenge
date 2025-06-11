//
//  AdDetailViewModel.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
import SwiftUI
import CoreLocation
import SwiftUI
import CoreLocation

final class AdDetailViewModel: ObservableObject {
    @Published var ad: AdDetail?
    @Published var isLoading = false
    @Published var error: Error?
    @Published var isFavorite: Bool = false

    private let adId: String
    private let service: AdDetailServiceProtocol

    init(adId: String, service: AdDetailServiceProtocol = AdDetailService()) {
        self.adId = adId
        self.service = service
    }

    @MainActor
    func fetchAdDetail() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await service.fetchDetail(for: adId)
            self.ad = result
        } catch {
            self.error = error
        }
    }

    func toggleFavoriteStatus() {
        guard let ad else { return }
        FavoritesManager.shared.toggleFavorite(id: String(ad.id))
        isFavorite = FavoritesManager.shared.isFavorite(id: String(ad.id))
    }

    func getIsFavorite() {
        guard let ad else { return }
        isFavorite = FavoritesManager.shared.isFavorite(id: String(ad.id))
    }

    func favoriteLabelText() -> String {
        guard let ad else {
            return "addFavourite".localized
        }

        let dateText = FavoritesManager.shared.favoritedDate(for: String(ad.id))

        return isFavorite
            ? String(format: "favoriteDate".localized, dateText ?? "unknown".localized)
            : "addFavourite".localized
    }
}
