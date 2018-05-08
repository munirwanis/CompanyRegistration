//
//  CompanyRegistrationTests.swift
//  CompanyRegistrationTests
//
//  Created by Munir Wanis on 06/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import XCTest
@testable import CompanyRegistration

class ListCompaniesViewModelTests: XCTestCase {
    
    var viewModel: ListCompaniesViewModel = ListCompaniesViewModel()
    var viewModelFailure: ListCompaniesViewModel = ListCompaniesViewModel()
    
    override func setUp() {
        super.setUp()
        
        viewModel = ListCompaniesViewModel(data: RetrieveContactsMock())
        viewModelFailure = ListCompaniesViewModel(data: RetrieveContactsFailureMock())
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testInitials() {
        let initials = viewModel.initials(with: "Munir Xavier Wanis")
        XCTAssertTrue(initials == "MXW")
    }
    
    func testCompanyCount() {
        XCTAssertTrue(viewModel.count == RetrieveContactsMock().getCompanies().count)
    }
    
    func testEmptyCompanies() {
        XCTAssertTrue(viewModelFailure.isEmpty)
    }
    
    func testGetCompanyAt() {
        XCTAssertTrue(viewModel.getCompany(at: 0).name == RetrieveContactsMock().getCompanies()[0].fantasyName)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
