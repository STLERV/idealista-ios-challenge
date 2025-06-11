//
//  AddListsModel.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation
import UIKit

struct AdList {
    let id: String
    let address: String
    let thumbnailURL: URL
    let price: Double
    let city: String
    let propertyType: String
}
extension AdList {
    init(dto: AdDTO) {
        self.id = dto.propertyCode
        self.address = dto.address
        self.thumbnailURL = dto.thumbnail
        self.price = dto.price
        self.city = dto.municipality
        self.propertyType = dto.propertyType
    }
}
