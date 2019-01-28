//
//  Event.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import Foundation

struct EventReturnResponse: Codable {
    var data: Event
}

struct EventResponse: Codable {
    var data: [Event]
}

struct Event: Codable {
    var club: String
    var event: String
    var location: String
    var description: String
}
