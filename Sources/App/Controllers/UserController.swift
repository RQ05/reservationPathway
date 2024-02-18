//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 05/08/1445 AH.
//

import Foundation
 import Vapor

struct UserController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let users = routes.grouped("users") // to group all the functions of plants
        users.get(use : index) // calling the function
        users.post(use : create) // to make post request
        users.put(":id", use: update)
        users.delete(":id", use: delete)
    }
    
    func index (req :Request) async throws -> String {
        return "Get all users"}
    
    func create (req :Request) async throws -> String {
        return " create new user"}
    
    
    func update (req :Request) async throws -> String {
        let id = req.parameters.get("id")!
        return "update  users with  \(id)"}
    
    func delete (req :Request) async throws -> String {
        let id = req.parameters.get("id")!
        return "delete users with  \(id)"}
    
  
    
    
}
