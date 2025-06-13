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
    
    enum ViewState {
        case loading
        case success
        case error(String)
    }
    @Published var ad: AdDetail?
    @Published var isFavorite: Bool = false
    @Published var state: ViewState = .loading

    private let adId: String
    private let service: AdDetailServiceProtocol

    init(adId: String, service: AdDetailServiceProtocol = AdDetailService()) {
        self.adId = adId
        self.service = service
    }

    @MainActor
    func fetchAdDetail() async {
        await MainActor.run {
            state = .loading
        }
        do {
            let detailAd = try await service.fetchDetail(for: adId)
            self.ad = detailAd
           await MainActor.run {
                state = .success
            }
        } catch {
            await MainActor.run {
                state = .error("Error")
            }
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
        guard let ad else { return "addFavourite".localized }
        let dateText = FavoritesManager.shared.favoritedDate(for: String(ad.id))

        return isFavorite ? String(format: "favoriteDate".localized, dateText ?? "unknown".localized)
            : "addFavourite".localized
    }
}
