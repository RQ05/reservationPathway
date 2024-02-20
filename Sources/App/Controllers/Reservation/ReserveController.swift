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
            let users = routes.grouped("Reserve") // to group all the functions of plants
            
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
        
        
        func update (req :Request) throws -> EventLoopFuture<ReservationModel> {
            let input = try req.content.decode(ReservationModel.self)
            return ReservationModel.find(req.parameters.get("reserveID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{ reserve in
                    reserve.RoomID = input.RoomID
                    reserve.userID = input.userID
                    reserve.hours = input.hours
                    reserve.startDate = input.startDate
                    reserve.reservationStatus = input.reservationStatus
                 
                    return reserve.save(on: req.db).map {ReservationModel(id: reserve.id, roomID: reserve.RoomID, userID: reserve.userID, startDate: reserve.startDate, hours: reserve.hours, reservationStatus: reserve.reservationStatus)}
                }
        }
        
    }
 
