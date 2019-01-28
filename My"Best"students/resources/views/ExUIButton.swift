//
//  CustomUIButton.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 28/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//
import UIKit

extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}
