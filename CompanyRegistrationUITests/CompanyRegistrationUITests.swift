//
//  CompanyRegistrationUITests.swift
//  CompanyRegistrationUITests
//
//  Created by Munir Wanis on 11/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import XCTest

class CompanyRegistrationUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments += ["isUITest"]
        app.launchArguments += ["-AppleLanguages", "(en-US)"]
        app.launchArguments += ["-AppleLocale", "\"en-US\""]
        app.launchArguments += ["-StartFromCleanState", "YES"]
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testListCompanies() {
        let steveJobs = app.cells.staticTexts["Steve Jobs"]
        XCTAssertTrue(steveJobs.exists)
    }
    
    func testDetailCompany() {
        let billGates = app.cells.staticTexts["Bill Gates"]
        XCTAssertTrue(billGates.exists)
        billGates.tap()
        
        let companyName = app.cells.staticTexts["Microsoft Corporation"]
        XCTAssertTrue(companyName.exists)
    }
    
    func testDeleteCompany() {
        let ellonMusk = app.cells.staticTexts["Elon Musk"]
        XCTAssertTrue(ellonMusk.exists)
        ellonMusk.tap()
        
        let companyName = app.cells.staticTexts["Tesla"]
        XCTAssertTrue(companyName.exists)
        
        let deleteButton = app.buttons["deleteCompanyButton"]
        XCTAssertTrue(deleteButton.exists)
        deleteButton.tap()
        app.alerts["Apagar"].buttons["SIM"].tap()
    }
    
    func testCreateCompany() {
        let createButton = app.buttons["addCompanyButton"]
        XCTAssertTrue(createButton.exists)
        createButton.tap()
        
        let ownerNameTextField = self.app.textFields["Nome Completo"]
        XCTAssertTrue(ownerNameTextField.exists)
        ownerNameTextField.tap()
        ownerNameTextField.typeText("Munir Xavier Wanis")
        
        let emailTextField = self.app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("munir@wanis.com")
        
        let phoneTextField = self.app.textFields["Telefone"]
        XCTAssertTrue(phoneTextField.exists)
        phoneTextField.tap()
        phoneTextField.typeText("21981132324")
        
        let companyNameTextField = self.app.textFields["Nome Fantasia"]
        XCTAssertTrue(companyNameTextField.exists)
        companyNameTextField.tap()
        companyNameTextField.typeText("Wanis Co.")
        
        let cnpjTextField = self.app.textFields["CNPJ"]
        XCTAssertTrue(cnpjTextField.exists)
        cnpjTextField.tap()
        cnpjTextField.typeText("12345678912345")
        
        app.tables/*@START_MENU_TOKEN@*/.textFields["Data de Ativação"]/*[[".cells.textFields[\"Data de Ativação\"]",".textFields[\"Data de Ativação\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.datePickers.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "2010")
        
        let saveButton = app.buttons["Save"]
        XCTAssertTrue(saveButton.exists)
        saveButton.tap()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1000)) {
            let munirWanis = self.app.cells.staticTexts["Munir Xavier Wanis"]
            XCTAssertTrue(munirWanis.exists)
        }
    }
}
