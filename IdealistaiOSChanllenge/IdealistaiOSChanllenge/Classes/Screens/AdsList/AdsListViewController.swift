//
//  AdsListViewController.swift
//  iOSChallenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import Foundation
import UIKit

protocol AdsListViewControllerProtocol  {
    func displayAds(ads: [AdList])
    func showLoading()
    func hideLoading()
}

class AdsListViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var presenter: AdsListPresenterProtocol?
    var delegate: AdsListCoordinatorProtocol?
    
    public convenience init(presenter: AdsListPresenter) {
        self.init(nibName: "AdsListViewController", bundle: nil)
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSetUp()
    }
    func viewDidLoadSetUp() {
        label.text = "Title"
        presenter?.onViewDidLoad()
    }
}

extension AdsListViewController: AdsListViewControllerProtocol {
    
    func showLoading() {
        print("Cargando anuncios...")
    }

    func hideLoading() {
        print("Carga finalizada")
    }

    func displayAds(ads: [AdList]) {
        ads.forEach { print(" \($0.title) - \(Int($0.price))€ - \($0.city)") }
    }
}
