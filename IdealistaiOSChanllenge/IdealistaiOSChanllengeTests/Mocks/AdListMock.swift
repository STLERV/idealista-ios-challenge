//
//  AdListMock.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 13/6/25.
//
@testable import IdealistaiOSChanllenge
import Foundation

extension AdList {
    static var mock: AdList {
        AdList(
            id: "1",
            address: "Address Street",
            thumbnailURL: URL(string: "https://google.com")!,
            price: 1000,
            city: "Flat",
            propertyType: "Flat"
        )
    }
}
