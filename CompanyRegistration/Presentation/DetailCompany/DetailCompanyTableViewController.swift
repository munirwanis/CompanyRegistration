//
//  DetailCompanyTableViewController.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit

class DetailCompanyTableViewController: UITableViewController {
    let viewModel = DetailCompanyViewModel()
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cnpjLabel: UILabel!
    @IBOutlet weak var activitiesDateLabel: UILabel!
    @IBOutlet weak var isMeiLabel: UILabel!
    
    @IBOutlet weak var deleteCompanyButton: UIBarButtonItem!
    
    var presentation: DetailCompanyPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyNameLabel.text = presentation.companyName
        ownerNameLabel.text = presentation.ownerName
        emailLabel.text = presentation.email
        phoneLabel.text = presentation.phone
        cnpjLabel.text = presentation.cnpj
        activitiesDateLabel.text = presentation.activationDate
        isMeiLabel.text = presentation.isMei
        
        deleteCompanyButton.accessibilityIdentifier = "deleteCompanyButton"
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Erro", message: "Não foi possível apagar este usuário.\nPor favor, tente mais tarde.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - Actions

extension DetailCompanyTableViewController {
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Apagar", message: "Você está certo disso?\nEsta ação não pode ser desfeita.", preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "SIM", style: .destructive) { _ in
            if self.viewModel.delete(self.presentation) {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.showErrorAlert()
            }
        }
        alert.addAction(yesButton)
        
        let noButton = UIAlertAction(title: "NÃO", style: .cancel, handler: nil)
        alert.addAction(noButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}
