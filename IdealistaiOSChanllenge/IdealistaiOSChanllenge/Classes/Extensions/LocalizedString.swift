//
//  LocalizedString.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 10/6/25.
//
import UIKit

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
