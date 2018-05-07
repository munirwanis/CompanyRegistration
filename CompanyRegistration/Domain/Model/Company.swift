//
//  Company.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 07/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

struct Company: ModelProtocol {
    var validations: [(() -> ValidationState)] = []
    
    let founderName: String
    let email: String
    let phoneNumber: String
    let fantasyName: String
    let cnpj: String
    let activitiesStartingDate: Date
    let isMei: Bool
    
    init(founderName: String, email: String, phoneNumber: String, fantasyName: String, cnpj: String, activitiesStartingDate: Date, isMei: Bool) {
        self.founderName = founderName
        self.email = email
        self.phoneNumber = phoneNumber
        self.fantasyName = fantasyName
        self.cnpj = cnpj
        self.activitiesStartingDate = activitiesStartingDate
        self.isMei = isMei
        
        self.validations = [validateName, validateEmail, validatePhone, validateCNPJ]
    }
}


// MARK: - Validations

extension Company {
    private func validateName() -> ValidationState {
        let count = founderName.split(separator: " ").count
        if count < 2 {
            return .invalid("O nome do proprietário não é válido.")
        }
        return .valid
    }
    
    private func validateEmail() -> ValidationState {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailPredicate.evaluate(with: email) ? .valid : .invalid("O e-mail digitado não é válido.")
    }
    
    private func validatePhone() -> ValidationState {
        let regex = "[0-9]{11}"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return phonePredicate.evaluate(with: phoneNumber) ? .valid : .invalid("O telefone digitado não é válido.")
    }
    
    private func validateCNPJ() -> ValidationState {
        let regex = "[0-9]{14}"
        let cnpjPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return cnpjPredicate.evaluate(with: cnpj) ? .valid : .invalid("O CNPJ digitado não é válido.")
    }
}
