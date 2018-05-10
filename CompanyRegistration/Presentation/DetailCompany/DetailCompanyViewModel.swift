//
//  DetailCompanyViewModel.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class DetailCompanyViewModel {
    let data: RetrieveContacts
    
    init(data: RetrieveContacts = RetrieveContactsData()) {
        self.data = data
    }
    
    func delete(_ company: DetailCompanyPresentation) -> Bool {
        guard let company = data.getCompany(from: company.email) else {
            return false
        }
        return data.delete(company)
    }
}
