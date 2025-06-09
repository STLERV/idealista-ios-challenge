//
//  AdsListInteractor.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation

protocol AdsListInteractorProtocol {
    func fetchAds() async throws -> [AdList]
}

final class AdsListInteractor: AdsListInteractorProtocol {

    private let service: AdsServiceProtocol

    init(service: AdsServiceProtocol = AdsService()) {
        self.service = service
    }

    func fetchAds() async throws -> [AdList] {
        return try await service.fetchAdsList()
    }
}
