//
//  ExUINavigationIntem.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 30/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//
import UIKit

extension UINavigationItem: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}
