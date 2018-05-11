//
//  DetailCompanyViewModelTests.swift
//  CompanyRegistrationTests
//
//  Created by Munir Wanis on 11/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import XCTest
@testable import CompanyRegistration

class DetailCompanyViewModelTests: XCTestCase {
    
    var viewModel: DetailCompanyViewModel = DetailCompanyViewModel()
    var viewModelFailure: DetailCompanyViewModel = DetailCompanyViewModel()
    
    override func setUp() {
        super.setUp()
        
        viewModel = DetailCompanyViewModel(data: RetrieveContactsMock())
        viewModelFailure = DetailCompanyViewModel(data: RetrieveContactsFailureMock())
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testDeleteCompany() {
        let company = DetailCompanyPresentation(ownerName: "", email: "", phone: "", companyName: "", cnpj: "", activationDate: Date(), isMei: true)
        
        XCTAssertTrue(viewModel.delete(company))
    }
    
    func testDeleteCompanyFail() {
        let company = DetailCompanyPresentation(ownerName: "", email: "", phone: "", companyName: "", cnpj: "", activationDate: Date(), isMei: true)
        
        XCTAssertFalse(viewModelFailure.delete(company))
    }
}
