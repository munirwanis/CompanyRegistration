//
//  BaseCompanyViewModel.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 11/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class BaseCompanyViewModel {
    let data: RetrieveContacts
    
    init(data: RetrieveContacts = RetrieveContactsData()) {
        if AppDelegate.isUITest, data is RetrieveContactsData  {
            self.data = InMemoryContacts()
        } else {
            self.data = data
        }
    }
}
