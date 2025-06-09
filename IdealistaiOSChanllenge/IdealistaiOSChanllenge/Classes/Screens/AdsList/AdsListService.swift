//
//  AdsListService.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation
import CoreLocation

protocol AdsServiceProtocol {
    func fetchAdsList() async throws -> [AdList]
}

final class AdsService: AdsServiceProtocol {
    
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }

    func fetchAdsList() async throws -> [AdList] {
        let url = "https://idealista.github.io/ios-challenge/list.json"
        
        let dtoList: [AdDTO] = try await apiManager.apiCall(for: url)
        
        return dtoList.map { dto in
            AdList(id: dto.propertyCode,
                   title: dto.address,
                   thumbnailURL: dto.thumbnail,
                   price: dto.price,
                   city: dto.municipality)
        }
    }
}
