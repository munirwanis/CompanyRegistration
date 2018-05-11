//
//  RetrieveContacts.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

protocol RetrieveContacts {
    func getCompanies() -> [Company]
    func getCompany(from email: String) -> Company?
    func insert(_ company: Company) -> Bool
    func delete(_ company: Company) -> Bool
}
