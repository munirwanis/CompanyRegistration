//
//  CreateCompanyViewModelTests.swift
//  CompanyRegistrationTests
//
//  Created by Munir Wanis on 11/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import XCTest
@testable import CompanyRegistration

class CreateCompanyViewModelTests: XCTestCase {
    
    var viewModel: CreateCompanyViewModel = CreateCompanyViewModel()
    var viewModelFailure: CreateCompanyViewModel = CreateCompanyViewModel()
    
    override func setUp() {
        super.setUp()
        
        viewModel = CreateCompanyViewModel(data: RetrieveContactsMock(), headlines: InMemoryHeadlines())
        viewModelFailure = CreateCompanyViewModel(data: RetrieveContactsFailureMock())
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testDeleteCompany() {
        let company = CreateCompanyPresentation(ownerName: "Munir Wanis", email: "wanis@mail.com", phone: "21981232323", companyName: "Skynet", cnpj: "12345678912345", activationDate: Date(), isMei: true)
        XCTAssertNil(viewModel.save(company))
    }
    
    func testHeadlines() {
        let headlines = viewModel.getHeadlines()
        XCTAssertTrue(headlines.cnpj == "CNPJ")
        XCTAssertTrue(headlines.ownerName == "Nome Completo")
        XCTAssertTrue(headlines.email == "Email")
        XCTAssertTrue(headlines.phone == "Telefone")
        XCTAssertTrue(headlines.companyName == "Nome Fantasia")
        XCTAssertTrue(headlines.startDate == "Data de Ativação")
        XCTAssertTrue(headlines.isMei == "É MEI?")
    }
    
    func testDeleteCompanyFail() {
        let company = CreateCompanyPresentation(ownerName: "", email: "", phone: "", companyName: "", cnpj: "", activationDate: Date(), isMei: true)
        
        XCTAssertNotNil(viewModelFailure.save(company))
    }
}
