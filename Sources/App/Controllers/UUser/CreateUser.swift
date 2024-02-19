//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 08/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateUser : Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("user")
            .id()
            .field("Username", .string)
            .field("Email", .string)
            .field("Role", .string)
            .create()

    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("user").delete()

    }//end of the first step of migration 
}
