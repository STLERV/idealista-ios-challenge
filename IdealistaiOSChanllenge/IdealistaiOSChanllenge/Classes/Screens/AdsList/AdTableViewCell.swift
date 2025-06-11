//
//  AdTableViewCell.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    static let identifier = "AdTableViewCell"
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        cellImage.layer.cornerRadius = 16.0
    }
    //TODO: acabar celda
//    func setCell(cellTitle: String, cellImage: UIImage, price: String, type: String, city: String) {
//        headerText.text = header
//        title.text = text
//        iconImage.vuelingImage(icon)
//    }
//
//    private func setCellStyle() {
//        headerText.font = .Secondary.semiboldBodyS
//        headerText.setTextVueling(color: .neutralBackgroundHeavy)
//        title.font = .Secondary.regularBodyS
//        title.setTextVueling(color: .neutralBackgroundHeavy)
//    }
}
