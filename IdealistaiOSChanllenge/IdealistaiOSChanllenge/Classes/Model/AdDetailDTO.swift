//
//  AdDetailDTO.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

struct AdDetailDTO: Decodable {
    let adid: Int
    let price: Double
    let priceInfo: PriceInfoDTO
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: MultimediaDTO
    let propertyComment: String
    let ubication: UbicationDTO
    let country: String
    let moreCharacteristics: MoreCharacteristicsDTO
    let energyCertification: EnergyCertificationDTO
}

struct PriceInfoDTO: Decodable {
    let amount: Double
    let currencySuffix: String
}

struct MultimediaDTO: Decodable {
    let images: [ImageDTO]
}

struct ImageDTO: Decodable {
    let url: String
    let tag: String
}

struct UbicationDTO: Decodable {
    let latitude: Double
    let longitude: Double
}

struct MoreCharacteristicsDTO: Decodable {
    let communityCosts: Double
    let roomNumber: Int
    let bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType: String
    let flatLocation: String
    let modificationDate: Int64
    let constructedArea: Int
    let lift: Bool
    let boxroom: Bool
    let isDuplex: Bool
    let status: String
}

struct EnergyCertificationDTO: Decodable {
    let title: String
    let energyConsumption: CertificationTypeDTO
    let emissions: CertificationTypeDTO
}

struct CertificationTypeDTO: Decodable {
    let type: String
}
