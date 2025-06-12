//
//  AdTableViewCell.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 9/6/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    static let identifier = "AdTableViewCell"
    
    @IBOutlet weak var cellAdress: UILabel!
    @IBOutlet weak var cellCity: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var cellType: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setCellStyle()
    }
    func setCell(adress: String,
                 image: URL,
                 price: Double,
                 type: String,
                 city: String) {
        
        cellAdress.text = adress
        cellCity.text = city
        cellType.text = type
        cellPrice.text = String(price)
        cellImage.loadImage(from: image)
    }
    
    private func setCellStyle() {
        cellCity.font = UIFont.preferredFont(forTextStyle: .headline)
        cellCity.textColor = .label
        
        cellAdress.font = UIFont.preferredFont(forTextStyle: .subheadline)
        cellAdress.textColor = .secondaryLabel
        
        cellType.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cellType.textColor = .tertiaryLabel
        
        cellPrice.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        cellPrice.textColor = .tertiaryLabel
        
        cellImage.layer.cornerRadius = 18
        cellImage.contentMode = .scaleAspectFill
    }
}
