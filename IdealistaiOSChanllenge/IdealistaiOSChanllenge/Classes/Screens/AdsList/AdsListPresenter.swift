//
//  AdsListPresenter.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation

protocol AdsListPresenterProtocol {
    func onViewDidLoad()
    func getAd(index: Int) -> AdList?
    func getAdsCount() -> Int
}

final class AdsListPresenter: AdsListPresenterProtocol {

    var view: AdsListViewControllerProtocol?
    var ads: [AdList] = []
    private let interactor: AdsListInteractorProtocol

    init( interactor: AdsListInteractorProtocol) {
        self.interactor = interactor
    }

    func onViewDidLoad() {
        Task {
            do {
                let ads = try await interactor.fetchAds()
                self.ads = ads
                await MainActor.run {
                    view?.displayAds(ads: ads)
                }
            } catch {
                await MainActor.run {
                    view?.displayError(error: "error")
                }
            }
        }
    }

    func getAd(index: Int) -> AdList? {
        guard index >= 0, index < ads.count else { return nil }
        return ads[index]
    }

    func getAdsCount() -> Int {
        ads.count
    }
}
