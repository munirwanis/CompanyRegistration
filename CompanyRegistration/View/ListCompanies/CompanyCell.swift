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
    
    var data: CompanyPresentation? {
        didSet {
            companyNameLabel.text = data?.name
            companyInitialsLabel.text = data?.initials
            companyOwnerNameLabel.text = data?.ownerName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
