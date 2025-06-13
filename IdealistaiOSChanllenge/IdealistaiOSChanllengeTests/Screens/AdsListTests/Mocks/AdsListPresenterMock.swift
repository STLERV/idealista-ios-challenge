//
//  AdsListPresenterMock.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//
import XCTest
@testable import IdealistaiOSChanllenge

class AdsListPresenterMock: AdsListPresenterProtocol {
    
    var onViewDidLoadCount = 0
    var getAdsCountCount = 0
    var getAdCount = 0
    var adIndexRequested: Int? = nil

    var mockAds: [AdList] = [AdList.mock]

    func onViewDidLoad() {
        onViewDidLoadCount += 1
    }

    func getAdsCount() -> Int {
        getAdsCountCount += 1
        return mockAds.count
    }

    func getAd(index: Int) -> AdList {
        getAdCount += 1
        adIndexRequested = index
        return mockAds[index]
    }
}

