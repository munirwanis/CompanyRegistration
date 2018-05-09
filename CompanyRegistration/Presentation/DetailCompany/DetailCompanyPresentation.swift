//
//  DetailCompanyPresentation.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

struct DetailCompanyPresentation {
    let ownerName: String
    let email: String
    let phone: String
    let companyName: String
    let cnpj: String
    let activationDate: String
    let isMei: String
    
    init(ownerName: String, email: String, phone: String, companyName: String, cnpj: String, activationDate: Date, isMei: Bool) {
        self.ownerName = ownerName
        self.email = email
        self.phone = phone
        self.companyName = companyName
        self.cnpj = cnpj
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        self.activationDate = dateFormatter.string(from: activationDate)
        self.isMei = isMei ? "Sim" : "Não"
    }
}
