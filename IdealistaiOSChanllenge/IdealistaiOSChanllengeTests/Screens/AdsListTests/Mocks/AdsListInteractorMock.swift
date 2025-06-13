//
//  AdsListInteractorMock.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//

import XCTest
@testable import IdealistaiOSChanllenge

class AdsListInteractorMock: AdsListInteractorProtocol {
    
    var fetchAdsCount = 0

    func fetchAds() async throws -> [AdList] {
        fetchAdsCount += 1
        return [AdList.mock]
    }
}
