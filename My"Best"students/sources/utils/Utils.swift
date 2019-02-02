//
//  Utils.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 01/02/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class Utils {
    static func isTextFAvailable(textField: UITextField) -> Bool {
        let text:String = textField.text!
        
        if (text.isEmpty) {
            return false
        }
        
        if (text.trimmingCharacters     (in: .whitespaces).isEmpty) {
            return false
        }
        return true
    }
    
    static func showAlert(controller: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(actionOk)

        controller.present(alertController, animated: true, completion: nil)

    }
}
