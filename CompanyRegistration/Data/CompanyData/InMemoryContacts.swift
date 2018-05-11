//
//  InMemoryContacts.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class InMemoryContacts: RetrieveContacts {
    static let company1 = Company(ownerName: "Steve Jobs", email: "jobs@apple.com", phone: "21981122335", companyName: "Apple Inc.", cnpj: "11253356651", activationDate: Date(), isMei: false)
    static let company2 = Company(ownerName: "Bill Gates", email: "gates@windows.com", phone: "21981122335", companyName: "Microsoft Corporation", cnpj: "11253356651", activationDate: Date(), isMei: false)
    static let company3 = Company(ownerName: "Elon Musk", email: "musk@tesla.com", phone: "21981122335", companyName: "Tesla", cnpj: "11253356651", activationDate: Date(), isMei: false)
    static let company4 = Company(ownerName: "Steve Jobs", email: "jobs@next.com", phone: "21981122335", companyName: "Next Computers Enterteinment", cnpj: "11253356651", activationDate: Date(), isMei: false)
    static var companies: [Company] = [company1, company2, company3, company4]
    
    func getCompanies() -> [Company] {
        return InMemoryContacts.companies
    }
    
    func getCompany(from email: String) -> Company? {
        return InMemoryContacts.companies.first { $0.email == email }
    }
    
    func insert(_ company: Company) -> Bool {
        InMemoryContacts.companies.append(company)
        return true
    }
    
    func delete(_ company: Company) -> Bool {
        guard let index = InMemoryContacts.companies.index(where: { $0.email == company.email }) else {
            return false
        }
        InMemoryContacts.companies.remove(at: index)
        return true
    }
}
