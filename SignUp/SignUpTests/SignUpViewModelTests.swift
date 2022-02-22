//
//  SignUpViewModelTests.swift
//  SignUpTests
//
//  Created by Jacob on 2/20/22.
//

import XCTest
@testable import SignUp

class SignUpViewModelTests: XCTestCase {

    var viewModel: SignUpViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SignUpViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSuccessfulSignUp() {
        // Inputs
        viewModel.inputs.nameDidChange("jacob")
        viewModel.inputs.emailDidChange("jacob@gmail.com")
        viewModel.inputs.genderDidChange(.male)
        viewModel.inputs.passwordDidChange("Test")
        viewModel.inputs.confirmPasswordDidChange("Test")
        viewModel.inputs.usernameDidChange("Jacob")
        viewModel.inputs.registerButtonDidClick()

        // Assertions
        XCTAssertNotNil(viewModel.outputs.isSignUpSuccessful)
        XCTAssertEqual(viewModel.outputs.isSignUpSuccessful, true)
    }

    func testFailedSignUpEmailRequired() {
        // Inputs
        viewModel.inputs.genderDidChange(.male)
        viewModel.inputs.passwordDidChange("Test")
        viewModel.inputs.confirmPasswordDidChange("Test")
        viewModel.inputs.registerButtonDidClick()

        // Assertions
        XCTAssertNil(viewModel.outputs.isSignUpSuccessful)
        XCTAssertNotNil(viewModel.outputs.emailErrorMessage)
    }
}
