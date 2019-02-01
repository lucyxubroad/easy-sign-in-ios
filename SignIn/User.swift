//
//  User.swift
//  SignIn
//
//  Created by Lucy Xu on 1/27/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import Foundation

struct EventAttendeeResponse: Codable {
    var data: [User]
}

struct RegisterUserResponse: Codable {
    var session_token: String
    var session_expiration: String
    var update_token: String
    var user: User
}

struct User: Codable {
    var email: String
    var first_name: String
    var last_name: String
    var id: Int
}
