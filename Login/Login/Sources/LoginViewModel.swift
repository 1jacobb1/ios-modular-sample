//
//  LoginViewModel.swift
//  Login
//
//  Created by Jacob on 2/20/22.
//

import Workplace_Core

protocol LoginViewModelInputs {
    func loginIdDidChange(_ loginId: String)
    func passwordDidChange(_ password: String)
    func loginButtonDidClick()
}

protocol LoginViewModelOutputs {
    var isSuccessfullyLoggedIn: Bool? { get }
    var loginIdErrorMessage: String? { get }
    var passwordErrorMessage: String? { get }   
}

protocol LoginViewModelTypes {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

class LoginViewModel: LoginViewModelTypes,
                      LoginViewModelInputs,
LoginViewModelOutputs {

    var inputs: LoginViewModelInputs { self }
    var outputs: LoginViewModelOutputs { self }

    var isSuccessfullyLoggedIn: Bool?
    var loginIdErrorMessage: String?
    var passwordErrorMessage: String?

    init() {
    }

    private var loginIdProp: String?
    func loginIdDidChange(_ loginId: String) {
        loginIdProp = loginId
    }

    private var passwordProp: String?
    func passwordDidChange(_ password: String) {
        passwordProp = password
    }

    func loginButtonDidClick() {
        doValidateAndProcessLogin()
    }

    private func doValidateAndProcessLogin() {
        let loginId = loginIdProp ?? ""
        let password = passwordProp ?? ""

        loginIdErrorMessage = nil
        passwordErrorMessage = nil

        if loginId.isEmpty {
            loginIdErrorMessage = "Username is required"
        }

        if password.isEmpty {
            passwordErrorMessage = "Password is required"
        }

        if loginIdErrorMessage == nil,
           passwordErrorMessage == nil {
            isSuccessfullyLoggedIn = true
        }
    }
}
