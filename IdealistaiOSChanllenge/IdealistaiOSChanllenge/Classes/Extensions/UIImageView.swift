//
//  UIImageView.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 10/6/25.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        image = UIImage(systemName: "photo")
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    await MainActor.run {
                        self.image = image
                    }
                }
            }
        }
    }
}
