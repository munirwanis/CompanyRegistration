//
//  ListCompaniesViewModel.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit

class ListCompaniesViewModel {
    private let data: RetrieveContacts
    
    var isEmpty: Bool {
        return !(data.getCompanies().count > 0)
    }
    
    var count: Int {
        return data.getCompanies().count
    }
    
    init(data: RetrieveContacts = InMemoryContacts()) {
        self.data = data
    }
    
    func getCompany(at position: Int) -> CompanyPresentation {
        let company = data.getCompanies()[position]
        
        return CompanyPresentation(name: company.companyName, ownerName: company.ownerName, initials: initials(with: company.companyName))
    }
    
    func removeCompany(at position: Int) -> Bool {
        return data.delete(data.getCompanies()[position])
    }
    
    func prepare(for segue: UIStoryboardSegue, at position: Int) {
        guard let viewController = segue.destination as? DetailCompanyTableViewController else {
            return
        }
        let company = data.getCompanies()[position]
        let detailPresentation = DetailCompanyPresentation(ownerName: company.ownerName, email: company.email, phone: company.phone, companyName: company.companyName, cnpj: company.cnpj, activationDate: company.activationDate, isMei: company.isMei)
        viewController.presentation = detailPresentation
    }
    
    func initials(with name: String) -> String {
        var words = name.components(separatedBy: " ")
        if words.count > 3 {
            words.removeSubrange(3..<words.count)
        }
        
        let initials = words.reduce("") { (result: String, next: String) -> String in
            return result + String(next.first ?? Character(""))
        }
        return initials.uppercased()
    }
}
