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
    private let colors = [
        UIColor(named: "Orange"),
        UIColor(named: "Purple"),
        UIColor(named: "Wine"),
        UIColor(named: "Yellow")
    ]
    
    var data: CompanyPresentation? {
        didSet {
            companyNameLabel.text = data?.name
            companyInitialsLabel.text = data?.initials
            companyOwnerNameLabel.text = data?.ownerName
            
            Do.wait(seconds: 0.2) {
                let random = Int(arc4random_uniform(UInt32(self.colors.count-1)))
                self.companyInitialsLabel.backgroundColor = self.colors[random]
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
