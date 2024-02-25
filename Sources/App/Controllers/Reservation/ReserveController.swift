//
//  File.swift
//
//
//  Created by Reyouf Alqahtani on 05/08/1445 AH.
//

//Reserve

import Foundation
 import Vapor
import FluentPostgresDriver

        
struct ReserveController : RouteCollection {
        func boot(routes: Vapor.RoutesBuilder) throws {
            let users = routes.grouped("reserve") // to group all the functions of plants
            
            users.get(use: index) // calling the function
            
            users.post(use : create) // to make post request
            
            users.delete(":reserveID", use: delete)

            users.put(":reserveID",use: update)
        }
        
        
        func index(req :Request) throws -> EventLoopFuture<[ReservationModel]> {
            return ReservationModel.query(on: req.db).all()
        }
        
        func create (req :Request) throws -> EventLoopFuture<ReservationModel> {
            let room = try req.content.decode(ReservationModel.self)
            return room.save(on: req.db).map { room }
        }
        
        func delete (req :Request) throws -> EventLoopFuture<HTTPStatus> {
            return ReservationModel.find(req.parameters.get("reserveID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{$0.delete(on: req.db)}
                .transform(to: .ok)
        }
        
        
    func update(req: Request) throws -> EventLoopFuture<ReservationModel> {
        let input = try req.content.decode(ReservationModel.self)
        
        return ReservationModel.find(req.parameters.get("reserveID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { reserve in
                reserve.room = input.room
                reserve.user = input.user
                reserve.hours = input.hours
                reserve.startDate = input.startDate
                reserve.reservationStatus = input.reservationStatus
                
                return reserve.save(on: req.db).map { reserve }
            }
    }
    }
 

/*
 {
     "Availability": true,
     "Discription": "backend room",
     "RoomName": "academy",
     "Equipment": "screen",
     "Capacity": 123
 }
 
 
 {
     "Availability": true,
     "id": "A592575A-1728-44AF-BA00-E22D4D635FAA",
     "Discription": "backend room",
     "RoomName": "lab5",
     "Equipment": "screen",
     "Capacity": 123
 }
 
 
 {
       "role": "Student",
       "username": "malak",
       "id": "7F13C49E-AD84-498C-B3E4-1A484E02A4C0",
       "email": "ha@ha"
   },
 
 
 {
     "room": "A592575A-1728-44AF-BA00-E22D4D635FAA",
     "user": "7F13C49E-AD84-498C-B3E4-1A484E02A4C0",
     "startDate": "2024-02-21T12:00:00Z",
     "hours": "1",
     "reservationStatus": "booked"
 }
 
 {
   "room" : {"id": "A592575A-1728-44AF-BA00-E22D4D635FAA"} ,
  "user": {"id": "7F13C49E-AD84-498C-B3E4-1A484E02A4C0"},
     "startDate" : "2024-02-21",
     "hours": "1",
     "reservationStatus": "booked"
 }
 
 
 */
