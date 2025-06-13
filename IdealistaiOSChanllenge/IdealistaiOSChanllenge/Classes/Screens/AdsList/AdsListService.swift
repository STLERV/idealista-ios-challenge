//
//  AdsListService.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation
//import CoreLocation
import UIKit

protocol AdsServiceProtocol {
    func fetchAdsList() async throws -> [AdList]
}

final class AdsService: AdsServiceProtocol {
    
    private let apiManager: ApiManagerProtocol
    
    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    func fetchAdsList() async throws -> [AdList] {
        let dtoList: [AdDTO] = try await apiManager.apiCall(for: APIPaths.adsLists)
        return dtoList.map { dto in
            AdList(dto: dto)
        }
    }
}
