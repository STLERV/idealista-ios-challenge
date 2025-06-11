//
//  AppCoordinator.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//
import Foundation
import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

class AppCoordinator: Coordinator {

    var window: UIWindow
    var childCoordinators: [Coordinator] = []

    lazy var navigationController: UINavigationController = {
        getNavigation()
    }()

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    private func getNavigation() -> UINavigationController {
        let navigator = UINavigationController()
        return navigator
    }

    func start() {
        showHome()
    }

    func showHome() {
        let coordinator = AdsListCoordinator(navigationController: navigationController)
        let interactor = AdsListInteractor()
        let presenter = AdsListPresenter(interactor: interactor)
        let view = AdsListViewController(presenter: presenter)

        view.delegate = coordinator
        presenter.view = view

        navigationController.setViewControllers([view], animated: true)
    }
}
