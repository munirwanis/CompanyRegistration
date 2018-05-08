//
//  ListCompaniesViewModel.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class ListCompaniesViewModel {
    private let data: RetrieveContacts
    private var companies: [Company]
    
    var isEmpty: Bool {
        return !(companies.count > 0)
    }
    
    var count: Int {
        return companies.count
    }
    
    init(data: RetrieveContacts = InMemoryContacts()) {
        self.data = data
        self.companies = data.getCompanies()
    }
    
    func getCompany(at position: Int) -> CompanyPresentation {
        let company = companies[position]
        
        return CompanyPresentation(name: company.fantasyName, ownerName: company.founderName, initials: initials(with: company.fantasyName))
    }
    
    func removeCompany(at position: Int) -> Bool {
        return data.delete(companies[position])
    }
    
    func initials(with name: String) -> String {
        var words = name.components(separatedBy: " ")
        if words.count > 3 {
            words.removeSubrange(3..<words.count)
        }
        
        let initials = words.reduce("") { (result: String, next: String) -> String in
            return result + String(next.first ?? Character(""))
        }
        return initials
    }
}
