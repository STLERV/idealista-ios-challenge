//
//  AdsDTO.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
import Foundation

struct AdsListsDTO: Decodable {
    let ads: [AdDTO]
}

struct AdDTO: Decodable {
    let propertyCode: String
    let thumbnail: URL
    let price: Double
    let propertyType: String
    let operation: String
    let size: Double
    let exterior: Bool
    let rooms: Int
    let bathrooms: Int
    let address: String
    let province: String
    let municipality: String
    let district: String
    let country: String
    let neighborhood: String
    let latitude: Double
    let longitude: Double
    let description: String
    let multimedia: MultimediaDTO?
    let features: FeaturesDTO?
    
    struct MultimediaDTO: Decodable {
        let images: [ImageDTO]
    }

    struct ImageDTO: Decodable {
        let url: URL
        let tag: String
    }

    struct FeaturesDTO: Decodable {
        let hasAirConditioning: Bool
        let hasBoxRoom: Bool
    }
}
