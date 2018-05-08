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
        let company1 = Company(founderName: "Steve Jobs", email: "jobs@apple.com", phoneNumber: "21981122335", fantasyName: "Apple Inc.", cnpj: "11253356651", activitiesStartingDate: Date(), isMei: false)
        let company2 = Company(founderName: "Bill Gates", email: "gates@windows.com", phoneNumber: "21981122335", fantasyName: "Microsoft Corporation", cnpj: "11253356651", activitiesStartingDate: Date(), isMei: false)
        let company3 = Company(founderName: "Elon Musk", email: "musk@tesla.com", phoneNumber: "21981122335", fantasyName: "Tesla", cnpj: "11253356651", activitiesStartingDate: Date(), isMei: false)
        let company4 = Company(founderName: "Steve Jobs", email: "jobs@next.com", phoneNumber: "21981122335", fantasyName: "Next Computers Enterteinment", cnpj: "11253356651", activitiesStartingDate: Date(), isMei: false)
        return [company1, company2, company3, company4]
    }
    
    func getCompany(from email: String) -> Company? {
        return Company(founderName: "Steve Jobs", email: "jobs@apple.com", phoneNumber: "21981122335", fantasyName: "Apple Inc.", cnpj: "11253356651", activitiesStartingDate: Date(), isMei: false)
    }
    
    func insert(_ company: Company) -> Bool {
        return true
    }
    
    func delete(_ company: Company) -> Bool {
        return true
    }
}
