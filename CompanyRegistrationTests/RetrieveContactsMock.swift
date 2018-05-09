//
//  RetrieveContactsMock.swift
//  CompanyRegistrationTests
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation
@testable import CompanyRegistration

class RetrieveContactsMock: RetrieveContacts {
    func getCompanies() -> [Company] {
        let company1 = Company(ownerName: "Steve Jobs", email: "jobs@apple.com", phone: "21981122335", companyName: "Apple Inc.", cnpj: "11253356651", activationDate: Date(), isMei: false)
        let company2 = Company(ownerName: "Bill Gates", email: "gates@windows.com", phone: "21981122335", companyName: "Microsoft Corporation", cnpj: "11253356651", activationDate: Date(), isMei: false)
        let company3 = Company(ownerName: "Elon Musk", email: "musk@tesla.com", phone: "21981122335", companyName: "Tesla", cnpj: "11253356651", activationDate: Date(), isMei: false)
        let company4 = Company(ownerName: "Steve Jobs", email: "jobs@next.com", phone: "21981122335", companyName: "Next Computers Enterteinment", cnpj: "11253356651", activationDate: Date(), isMei: false)
        return [company1, company2, company3, company4]
    }
    
    func getCompany(from email: String) -> Company? {
        return Company(ownerName: "Steve Jobs", email: "jobs@apple.com", phone: "21981122335", companyName: "Apple Inc.", cnpj: "11253356651", activationDate: Date(), isMei: false)
    }
    
    func insert(_ company: Company) -> Bool {
        return true
    }
    
    func delete(_ company: Company) -> Bool {
        return true
    }
}
