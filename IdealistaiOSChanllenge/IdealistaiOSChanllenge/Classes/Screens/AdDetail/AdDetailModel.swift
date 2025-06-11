import Foundation
import CoreLocation

struct AdDetail {
    let id: Int
    let priceFormatted: String
    let description: String
    let latitude: Double
    let longitude: Double
    let images: [String]
    let bedrooms: Int
    let bathrooms: Int
    let area: Int
    let hasLift: Bool
    let energyLabel: String
    let extendedPropertyType: String
    let operation: String
}

extension AdDetail {
    init(dto: AdDetailDTO) {
        self.id = dto.adid
        self.priceFormatted = "\(Int(dto.priceInfo.amount))\(dto.priceInfo.currencySuffix)"
        self.description = dto.propertyComment
        self.latitude = dto.ubication.latitude
        self.longitude = dto.ubication.longitude
        self.images = dto.multimedia.images.map { $0.url }
        self.bedrooms = dto.moreCharacteristics.roomNumber
        self.bathrooms = dto.moreCharacteristics.bathNumber
        self.area = dto.moreCharacteristics.constructedArea
        self.hasLift = dto.moreCharacteristics.lift
        self.energyLabel = dto.energyCertification.energyConsumption.type.uppercased()
        self.extendedPropertyType = dto.extendedPropertyType
        self.operation = dto.operation
    }

    var hasLiftText: String {
        hasLift ? "yes".localized : "no".localized
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
