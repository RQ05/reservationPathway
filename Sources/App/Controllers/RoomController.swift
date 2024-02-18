//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 05/08/1445 AH.
//


import Foundation
 import Vapor

struct RoomController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let Rooms = routes.grouped("Rooms") // to group all the functions of plants
        Rooms.get(use : index) // calling the function
        Rooms.post(use : create) // to make post request
        Rooms.put(":id", use: update)
        Rooms.delete(":id", use: delete)
        
    }
    
    func index (req :Request) async throws -> String {
        return "Get all rooms"}
    
    func create (req :Request) async throws -> String {
        return " create new Rooms"}
    
    
    func update (req :Request) async throws -> String {
        let id = req.parameters.get("id")!
        return "update  Room with  \(id)"}
    
    func delete (req :Request) async throws -> String {
        let id = req.parameters.get("id")!
        return "delete Room with  \(id)"}
    
  
    
    
}
