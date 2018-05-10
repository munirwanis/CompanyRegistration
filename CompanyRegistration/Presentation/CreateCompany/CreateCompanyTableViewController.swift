//
//  CreateCompanyTableViewController.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit
import VSTextField

class CreateCompanyTableViewController: UITableViewController {
    @IBOutlet weak var ownerNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: VSTextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var cnpjTextField: VSTextField!
    @IBOutlet weak var activationDateTextField: UITextField!
    @IBOutlet weak var isMeiSwitch: UISwitch!
    
    private var presentation = CreateCompanyPresentation()
    private let viewModel = CreateCompanyViewModel()
    
    private lazy var dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.timeStyle = .none
        f.dateStyle = .long
        return f
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let p = UIDatePicker()
        p.datePickerMode = .date
        p.maximumDate = Date()
        p.date = Date()
        p.addTarget(self, action: #selector(datePickerValueDidChange), for: .valueChanged)
        return p
    }()
    
    private lazy var keyboardToolbar: UIToolbar = {
        let t = UIToolbar()
        
        t.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40)
        
        let okButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(toolbarButtonPressed))
        t.setItems([okButton], animated: true)
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}


// MARK: - Setup

extension CreateCompanyTableViewController {
    private func setup() {
        phoneTextField.setFormatting("(**) *** *** ***", replacementChar: "*")
        cnpjTextField.setFormatting("**.***.***/****-**", replacementChar: "*")
        activationDateTextField.inputView = datePicker
        addInputAccessory(for: [ownerNameTextField, emailTextField, phoneTextField, companyTextField, cnpjTextField, activationDateTextField], previousNextable: true)
        ownerNameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        companyTextField.delegate = self
        cnpjTextField.delegate = self
        activationDateTextField.delegate = self
    }
}

// MARK: - TextField Delegate

extension CreateCompanyTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let nextTextField = view.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        }
        return false
    }
}

// MARK: - Actions

extension CreateCompanyTableViewController {
    @IBAction private func saveButtonPressed(_ sender: UIBarButtonItem) {
        presentation.ownerName = ownerNameTextField.text
        presentation.email = emailTextField.text
        presentation.phone = phoneTextField.text
        presentation.companyName = companyTextField.text
        presentation.cnpj = cnpjTextField.text
        presentation.isMei = isMeiSwitch.isOn
        
        if let errorMessage = viewModel.save(presentation) {
            let alert = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: .alert)
            let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(button)
            present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc private func datePickerValueDidChange(_ sender: UIDatePicker) {
        presentation.activationDate = sender.date
        activationDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc private func toolbarButtonPressed() {
        
    }
}
