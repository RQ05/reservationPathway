//
//  File.swift
//  
//
//  Created by Hasna Ahmad on 08/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateReservation : Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("reserve")
            .id()
            .field("room", .uuid ,.required ,  .references(RoomModel.schema, "id"))
            .field("user", .uuid , .required , .references(UserModel.schema, "id"))
            .field("startDate", .string)
            .field("hours", .string)
            .field("reservationStatus", .string)

            .create()

    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("reserve").delete()

    }//end of the first step of migration
}
