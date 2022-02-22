//
//  User.swift
//  Workplace-Core
//
//  Created by Jacob on 2/20/22.
//

import Foundation

public struct User {
    var id: Int
    var username: String?
    var email: String?
    var password: String?
    var name: String?
    var gender: Gender.RawValue

    public init(register username: String,
                email: String,
                password: String,
                name: String,
                gender: Gender) {
        id = 0
        self.username = username
        self.email = email
        self.password = password
        self.name = name
        self.gender = gender.rawValue
    }
}
