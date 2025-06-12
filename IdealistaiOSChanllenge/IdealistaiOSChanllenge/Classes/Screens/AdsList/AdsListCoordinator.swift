//
//  AdsListCoordinator.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation
import UIKit
import SwiftUI

protocol AdsListCoordinatorProtocol {
    func showAdDetail(index: String)
}

class AdsListCoordinator: AdsListCoordinatorProtocol {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showAdDetail(index: String) {
        let viewModel = AdDetailViewModel(adId: index)
        let detailView = AdDetailView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
