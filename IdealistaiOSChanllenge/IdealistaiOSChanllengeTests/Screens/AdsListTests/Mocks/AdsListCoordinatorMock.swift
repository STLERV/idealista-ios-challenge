//
//  AdsListCoordinatorMock.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//
import Foundation
import UIKit
@testable import IdealistaiOSChanllenge

class AdsListCoordinatorMock: AdsListCoordinatorProtocol {
    var goToDetailScreenCount = 0

    func showAdDetail(index: String) {
        goToDetailScreenCount += 1
    }
}
