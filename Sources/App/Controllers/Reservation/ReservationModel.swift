//
//  File.swift
//  
//
//  Created by Hasna Ahmad on 08/08/1445 AH.
//
import Foundation
import Fluent
import Vapor

final class ReservationModel: Model, Content {
    
    static let schema = "reserve"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "room")
    var room: RoomModel
    
    @Parent(key: "user")
    var user: UserModel
    
    @Field(key: "startDate")
    var startDate: Date
    
    @Field(key: "hours")
    var hours: String
    
    @Field(key: "reservationStatus")
    var reservationStatus: String
    
    init() {}
    
    init(id: UUID? = nil, room: UUID, user: UUID, startDate: Date, hours: String, reservationStatus: String) {
        self.id = id
        self.$room.id = room
        self.$user.id = user
        self.startDate = startDate
        self.hours = hours
        self.reservationStatus = reservationStatus
    }
}
