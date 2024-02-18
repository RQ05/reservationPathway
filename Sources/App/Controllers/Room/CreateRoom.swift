//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 08/08/1445 AH.

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateRoom : Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("rooms")
            .id()
            .field("RoomName", .string)
            .field("Discription", .string)
            .field("Discription", .string)
            .field("Capacity", .int)
            .field("Availability", .bool)

            .create()

    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("rooms").delete()

    }//end of the first step of migration
}
