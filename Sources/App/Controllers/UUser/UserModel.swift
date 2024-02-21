//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 08/08/1445 AH.
//

import Foundation
import Fluent
import Vapor

final class UserModel: Model, Content {
 
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "Username")
    var username: String
    
    @Field(key: "Email")
    var email: String
    
    @Field(key: "Role")
    var role: String
    
    // Add a reference to reservations made by this user
    @Children(for: \.$user)
    var reservations: [ReservationModel]
    
    init() {}
    
    init(id: UUID? = nil, username: String, email: String, role: String) {
        self.id = id
        self.username = username
        self.email = email
        self.role = role
    }
}
