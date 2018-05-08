//
//  RetrieveContactsFailureMock.swift
//  CompanyRegistrationTests
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation
@testable import CompanyRegistration

class RetrieveContactsFailureMock: RetrieveContacts {
    func getCompanies() -> [Company] {
        return []
    }
    
    func getCompany(from email: String) -> Company? {
        return nil
    }
    
    func insert(_ company: Company) -> Bool {
        return false
    }
    
    func delete(_ company: Company) -> Bool {
        return false
    }
}
