//
//  InMemoryContacts.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class InMemoryContacts: RetrieveContacts {
    static var companies: [Company] = []
    
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
