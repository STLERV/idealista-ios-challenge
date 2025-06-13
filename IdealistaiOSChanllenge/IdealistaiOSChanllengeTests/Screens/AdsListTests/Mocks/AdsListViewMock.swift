//
//  AdsListViewMock.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//

import XCTest
@testable import IdealistaiOSChanllenge


class AdsListViewMock: AdsListViewControllerProtocol {
    
    var displayAdsCount = 0
    func displayAds(ads: [AdList]) {
        displayAdsCount += 1
    }
}
