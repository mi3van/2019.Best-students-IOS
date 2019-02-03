//
//  StudentItemPage.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 30/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class StudentItemPage: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var averageTextField: UITextField!
    
    private let characterSetNum = "12345"
    private let characterSetAlphabet = "abcdefghijklmnopqrstuvwxyzабвгдежзийклмнопрстуфхцчшщъыьэюяё"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneNameTextFieldAction(_ sender: UITextField) {
        if (self.checkFieldAndShowAlert(textField: nameTextField)) {
        surnameTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func doneSurNameTextFieldAction(_ sender: UITextField) {
        if (self.checkFieldAndShowAlert(textField: surnameTextField)) {
            averageTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func doneAverageTextFieldAction(_ sender: UITextField) {
        if (self.checkAllTextFields()) {
            sender.becomeFirstResponder()
            sender.resignFirstResponder()
            self.saveData()
        }
    }
    
    private func checkFieldAndShowAlert(textField: UITextField) -> Bool {
        var successCheck = false
        let text = textField.text!
        let errorTitle = NSLocalizedString("input_error_title", comment: "")
        var errorMessage = ""
        
        successCheck = Utils.isTextFAvailable(textField:
            textField)
        if (textField == averageTextField) {
            if (successCheck) {
                let charset = CharacterSet(charactersIn: characterSetNum).inverted
                successCheck = text.rangeOfCharacter(from: charset) == nil
            }
            
            if (!successCheck) {
                let fieldTitle = NSLocalizedString ("edit_page_average", comment: "")
                errorMessage = String(format:  NSLocalizedString("input_error_numbers", comment: ""), fieldTitle)
            }
        } else {
            if (successCheck) {
                let charset = CharacterSet(charactersIn: characterSetAlphabet).inverted
                successCheck = text.lowercased().rangeOfCharacter (from: charset) == nil
            }
            
            if (!successCheck) {
                var fieldTitle = ""
                if (textField == nameTextField) {
                    fieldTitle = NSLocalizedString ("edit_page_name", comment: "")
                } else if (textField == surnameTextField) {
                    fieldTitle = NSLocalizedString ("edit_page_surname", comment: "")
                }
                errorMessage = String(format:  NSLocalizedString("input_error_letters", comment: ""), fieldTitle)
            }
        }
        
        if (!successCheck) {
            Utils.showAlert(controller: self, title: errorTitle, message: errorMessage)
        }
        return successCheck
    }

    @IBAction func CancelAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SaveAction(_ sender: Any) {
        if (self.checkAllTextFields()) {
            self.saveData()
        }
    }
    
    private func checkAllTextFields() -> Bool {
        var availableSave = false
        availableSave = checkFieldAndShowAlert(textField: nameTextField)
        if (availableSave) {
            availableSave = checkFieldAndShowAlert(textField: surnameTextField)
        }
        if (availableSave) {
            availableSave = checkFieldAndShowAlert(textField: averageTextField)
        }
        return availableSave
    }
    
    private func saveData() {
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        let assessment = Int(averageTextField.text!)!
        if (DataHelper.saveDataStudent(name: name, surname: surname, assessment: assessment)) {
            navigationController?.popViewController(animated: true)
        } else {
            Utils.showAlert(controller: self, title: NSLocalizedString("error_title", comment: ""), message: NSLocalizedString("error_data_description", comment: ""))
        }
    }
}
