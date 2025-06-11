//
//  AdDetailService.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
protocol AdDetailServiceProtocol {
    func fetchDetail(for id: String) async throws -> AdDetail
}

final class AdDetailService: AdDetailServiceProtocol {
    private let apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }

    func fetchDetail(for id: String) async throws -> AdDetail {
        let url = "https://idealista.github.io/ios-challenge/detail_\(id).json"
        let dtoDetail: AdDetailDTO = try await apiManager.apiCall(for: url)
     
        return AdDetail(dto: dtoDetail)
        }

}
