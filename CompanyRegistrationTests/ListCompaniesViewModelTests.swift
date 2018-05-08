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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitials() {
        let viewModel = ListCompaniesViewModel()
        let initials = viewModel.initials(with: "Munir Xavier Wanis")
        XCTAssertTrue(initials == "MXW")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
