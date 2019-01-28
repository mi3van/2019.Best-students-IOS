//
//  XIBLocalizable.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 28/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//
import UIKit

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}
protocol Localizable {
    var localized: String { get }
}
extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
