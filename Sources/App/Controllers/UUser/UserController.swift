//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 05/08/1445 AH.
//

import Foundation
import Vapor
import Fluent

struct UserController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let users = routes.grouped("users") // to group all the functions of plants
        
        users.get(use: index) // calling the function
        
        users.post(use : create) // to make post request
        
        users.delete(":userID", use: delete)

        users.put(":userID",use: update)
    }
    
    
    func index(req :Request) throws -> EventLoopFuture<[UserModel]> {
        return UserModel.query(on: req.db).all()
    }
    
    func create (req :Request) throws -> EventLoopFuture<UserModel> {
        let user = try req.content.decode(UserModel.self)
        return user.save(on: req.db).map { user }
    }
    
    func delete (req :Request) throws -> EventLoopFuture<HTTPStatus> {
        return UserModel.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{$0.delete(on: req.db)}
            .transform(to: .ok)
    }
    
    
    func update(req: Request) throws -> EventLoopFuture<UserModel> {
        let input = try req.content.decode(UserModel.self)
        return UserModel.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { user in
                user.username = input.username
                user.email = input.email
                user.role = input.role
                return user.save(on: req.db).map { user }
            }
    }

    
   
    
}


/*
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
 */
