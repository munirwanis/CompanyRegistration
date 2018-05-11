//
//  CreateCompanyViewModel.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 10/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class CreateCompanyViewModel: BaseCompanyViewModel {
    func save(_ company: CreateCompanyPresentation) -> String? {
        guard
            company.ownerName?.isEmpty == false,
            company.activationDate != nil,
            company.cnpj?.isEmpty == false,
            company.companyName?.isEmpty == false,
            company.email?.isEmpty == false,
            company.phone?.isEmpty == false
            else {
            return "Todos os campos devem ser preenchidos."
        }
        let company = Company(ownerName: company.ownerName!, email: company.email!, phone: company.phone!, companyName: company.companyName!, cnpj: company.cnpj!, activationDate: company.activationDate!, isMei: company.isMei)
        switch company.validate() {
        case .valid: return data.insert(company) ? nil : "Ocorreu um erro ao tentar salvar os dados.\nTente novamente mais tarde."
        case .invalid(let message): return message
        }
    }
}
