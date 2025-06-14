//
//  ApiManager.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
import Foundation

struct APIPaths {
    static let adsLists = "https://idealista.github.io/ios-challenge/list.json"
    static func adDetail(id: String) -> String {
        return "https://idealista.github.io/ios-challenge/detail_\(id).json"
    }
}

protocol ApiManagerProtocol {
    func apiCall<T: Decodable>(for url: String) async throws -> T
}

struct ApiManager: ApiManagerProtocol {
    static let shared = ApiManager()

    func apiCall<T: Decodable>(for url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NSError(domain: "jsonError",
                          code: 1,
                          userInfo: [NSLocalizedDescriptionKey : "error"])}
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
