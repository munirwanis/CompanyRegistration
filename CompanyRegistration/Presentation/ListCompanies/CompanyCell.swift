//
//  CompanyCell.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {

    @IBOutlet private weak var companyInitialsLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var companyOwnerNameLabel: UILabel!
    
    var initialsColor: UIColor? {
        didSet {
            Do.wait(seconds: 0.2) {
                self.companyInitialsLabel.backgroundColor = self.initialsColor ?? UIColor(named: "Purple")
            }
        }
    }
    
    var data: CompanyPresentation? {
        didSet {
            companyNameLabel.text = data?.name
            companyInitialsLabel.text = data?.initials
            companyOwnerNameLabel.text = data?.ownerName
        }
    }
}
