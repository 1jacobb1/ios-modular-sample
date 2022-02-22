//
//  LoginViewModelTests.swift
//  LoginTests
//
//  Created by Jacob on 2/20/22.
//

import XCTest
@testable import Login

class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSuccessfulLogin() {
        // Inputs
        viewModel.inputs.loginIdDidChange("jacob")
        viewModel.inputs.passwordDidChange("password")
        viewModel.inputs.loginButtonDidClick()

        // Assertions
        XCTAssertNotNil(viewModel.outputs.isSuccessfullyLoggedIn)
        XCTAssert(viewModel.outputs.isSuccessfullyLoggedIn == true)
        XCTAssertNil(viewModel.outputs.loginIdErrorMessage)
        XCTAssertNil(viewModel.outputs.passwordErrorMessage)
    }

    func testFailedLoginWithoutEnteringLoginId() {
        // Inputs
        viewModel.inputs.passwordDidChange("password")
        viewModel.inputs.loginButtonDidClick()

        // Assertions
        XCTAssertNotNil(viewModel.outputs.loginIdErrorMessage)
        XCTAssertNil(viewModel.outputs.isSuccessfullyLoggedIn)
    }
}
