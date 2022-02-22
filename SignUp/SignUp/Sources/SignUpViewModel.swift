//
//  SignUpViewModel.swift
//  SignUp
//
//  Created by Jacob on 2/20/22.
//

import Workplace_Core

protocol SignUpViewModelInputs {
    func usernameDidChange(_ username: String?)
    func emailDidChange(_ email: String?)
    func passwordDidChange(_ password: String?)
    func confirmPasswordDidChange(_ password: String?)
    func nameDidChange(_ name: String?)
    func genderDidChange(_ gender: Gender?)
    func registerButtonDidClick()
}

protocol SignUpViewModelOutputs {
    var isSignUpSuccessful: Bool? { get }
    var usernameErrorMessage: String? { get }
    var emailErrorMessage: String? { get }
    var passwordErrorMessage: String? { get }
    var confirmPasswordErrorMessage: String? { get }
    var nameErrorMessage: String? { get }
    var genderErrorMessage: String? { get }
}

protocol SignUpViewModelTypes {
    var inputs: SignUpViewModelInputs { get }
    var outputs: SignUpViewModelOutputs { get }
}

class SignUpViewModel: SignUpViewModelTypes,
                       SignUpViewModelInputs,
SignUpViewModelOutputs {

    var inputs: SignUpViewModelInputs { self }
    var outputs: SignUpViewModelOutputs { self }

    // MARK: - Outputs
    var isSignUpSuccessful: Bool? = nil
    var usernameErrorMessage: String? = nil
    var emailErrorMessage: String? = nil
    var passwordErrorMessage: String? = nil
    var confirmPasswordErrorMessage: String? = nil
    var nameErrorMessage: String? = nil
    var genderErrorMessage: String? = nil

    // MARK: - Inputs
    private var usernameProp: String?
    func usernameDidChange(_ username: String?) {
        usernameProp = username
    }

    private var emailProp: String?
    func emailDidChange(_ email: String?) {
        emailProp = email
    }

    private var passwordProp: String?
    func passwordDidChange(_ password: String?) {
        passwordProp = password
    }

    private var confirmPasswordProp: String?
    func confirmPasswordDidChange(_ password: String?) {
        confirmPasswordProp = password
    }

    private var nameProp: String?
    func nameDidChange(_ name: String?) {
        nameProp = name
    }

    private var genderProp: Gender?
    func genderDidChange(_ gender: Gender?) {
        genderProp = gender
    }

    func registerButtonDidClick() {
        doValidateAndRegister()
    }

    private func doValidateAndRegister() {

        let username = usernameProp ?? ""
        let email = emailProp ?? ""
        let name = nameProp ?? ""
        let password = passwordProp ?? ""
        let confirmPassword = confirmPasswordProp ?? ""

        usernameErrorMessage = ""
        emailErrorMessage = ""
        nameErrorMessage = ""
        passwordErrorMessage = ""
        confirmPasswordErrorMessage = ""

        if username.isEmpty {
            usernameErrorMessage = "Username is required"
        }

        if email.isEmpty {
            emailErrorMessage = "Email is required"
        }

        if name.isEmpty {
            nameErrorMessage = "Name is required"
        }

        if password.isEmpty {
            passwordErrorMessage = "Password is required"
        }

        if !password.isEmpty, password != confirmPassword {
            confirmPasswordErrorMessage = "Password does not match."
        }

        if usernameErrorMessage?.isEmpty == true,
           emailErrorMessage?.isEmpty == true,
           nameErrorMessage?.isEmpty == true,
           passwordErrorMessage?.isEmpty == true,
           confirmPasswordErrorMessage?.isEmpty == true {
            isSignUpSuccessful = true
        }
    }
}
