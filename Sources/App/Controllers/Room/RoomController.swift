//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 05/08/1445 AH.
//


import Foundation
 import Vapor
import FluentPostgresDriver

        
struct RoomController : RouteCollection {
        func boot(routes: Vapor.RoutesBuilder) throws {
            let users = routes.grouped("rooms") // to group all the functions of plants
            
            users.get(use: index) // calling the function
            
            users.post(use : create) // to make post request
            
            users.delete(":roomID", use: delete)

            users.put(":roomID",use: update)
        }
        
        
        func index(req :Request) throws -> EventLoopFuture<[RoomModel]> {
            return RoomModel.query(on: req.db).all()
        }
        
        func create (req :Request) throws -> EventLoopFuture<RoomModel> {
            let room = try req.content.decode(RoomModel.self)
            return room.save(on: req.db).map { room }
        }
        
        func delete (req :Request) throws -> EventLoopFuture<HTTPStatus> {
            return RoomModel.find(req.parameters.get("roomID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{$0.delete(on: req.db)}
                .transform(to: .ok)
        }
        
        
        func update (req :Request) throws -> EventLoopFuture<RoomModel> {
            let input = try req.content.decode(RoomModel.self)
            return RoomModel.find(req.parameters.get("roomID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{ room in
                    room.RoomName = input.RoomName
                    room.Discription = input.description
                    room.Equipment = input.Equipment
                    room.Capacity = input.Capacity
                    room.Availability = input.Availability
                    return room.save(on: req.db).map {RoomModel(id: room.id, RoomName: room.RoomName, Discription: room.Discription, Equipment: room.Equipment, Capacity: room.Capacity, Availability: room.Availability)}
                }
        }
        
    }
    

