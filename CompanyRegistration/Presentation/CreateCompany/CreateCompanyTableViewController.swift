//
//  CreateCompanyTableViewController.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit

class CreateCompanyTableViewController: UITableViewController {
    @IBOutlet weak var ownerNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var activationDateTextField: UITextField!
    @IBOutlet weak var isMeiSwitch: UISwitch!
    
    private var presentation = CreateCompanyPresentation()
    private lazy var viewModel: CreateCompanyViewModel = {
        return CreateCompanyViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
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
}
