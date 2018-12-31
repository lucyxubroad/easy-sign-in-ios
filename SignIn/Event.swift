//
//  Event.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import Foundation

class Event {
    var club: String
    var event: String
    var room: String
    var building: String
    
    init(club: String, event: String, room: String, building: String) {
        self.club = club
        self.event = event
        self.room = room
        self.building = building
    }
}
