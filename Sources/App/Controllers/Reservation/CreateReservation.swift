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
            .field("roomID", .uuid)
            .field("userID", .uuid)
            .field("startDate", .data)
            .field("hours", .string)
            .field("reservationStatus", .string)

            .create()

    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("reserve").delete()

    }//end of the first step of migration
}
