//
//  DetailCompanyTableViewController.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit

class DetailCompanyTableViewController: UITableViewController {
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cnpjLabel: UILabel!
    @IBOutlet weak var activitiesDateLabel: UILabel!
    @IBOutlet weak var isMeiLabel: UILabel!
    
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
    }
}
