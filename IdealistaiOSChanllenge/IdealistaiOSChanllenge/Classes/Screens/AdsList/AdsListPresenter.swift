//
//  AdsListPresenter.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation

protocol AdsListPresenterProtocol {
    func onViewDidLoad()
}

final class AdsListPresenter: AdsListPresenterProtocol {

    var view: AdsListViewControllerProtocol?
    private let interactor: AdsListInteractorProtocol

    init( interactor: AdsListInteractorProtocol) {
        self.interactor = interactor
    }

    func onViewDidLoad() {
        Task {
            view?.showLoading()
            do {
                let ads = try await interactor.fetchAds()
                view?.displayAds(ads: ads)
            } catch {
               print("ssss")
            }
            view?.hideLoading()
        }
    }
}
