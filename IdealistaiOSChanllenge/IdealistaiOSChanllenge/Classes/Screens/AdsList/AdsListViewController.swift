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
}

class AdsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    var presenter: AdsListPresenterProtocol?
    var delegate: AdsListCoordinatorProtocol?
    private let refreshControl = UIRefreshControl()

    public convenience init(presenter: AdsListPresenterProtocol) {
        self.init(nibName: "AdsListViewController", bundle: nil)
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSetUp()
    }

    func viewDidLoadSetUp() {
        presenter?.onViewDidLoad()
        configureTableView()
    }

    @objc private func didPullToRefresh() {
        presenter?.onViewDidLoad()
        refreshControl.endRefreshing()
    }
}

extension AdsListViewController: AdsListViewControllerProtocol {

    func displayAds(ads: [AdList]) {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}

extension AdsListViewController: UITableViewDelegate, UITableViewDataSource {

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        let adListCell = UINib(nibName: AdTableViewCell.identifier,
                               bundle: nil)
        tableView.register(adListCell,
                           forCellReuseIdentifier: AdTableViewCell.identifier)
    }

    private func dequeueCell(for tableView: UITableView, indexPath: IndexPath, identifier: String) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = presenter?.getAdsCount() else {
            return 0
        }
        return rows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier,
                                                       for:indexPath) as? AdTableViewCell else {
            return UITableViewCell()
        }
        guard let cellIndex = presenter?.getAd(index: indexPath.row)  else {
            return UITableViewCell()
        }
        item.setCell(adress: cellIndex.address,
                     image:  cellIndex.thumbnailURL,
                     price: cellIndex.price,
                     type: cellIndex.propertyType,
                     city: cellIndex.city)
        return item
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let adID = presenter?.getAd(index: indexPath.row).id {
            delegate?.showAdDetail(index: adID)
        }
        //error
    }
}
