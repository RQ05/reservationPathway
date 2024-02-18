//
//  File.swift
//
//
//  Created by Reyouf Alqahtani on 05/08/1445 AH.
//


import Foundation
 import Vapor

struct ReserveController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let Reserve = routes.grouped("Reserve") // to group all the functions of plants
        Reserve.get(use : index) // calling the function
        Reserve.post(use : create) // to make post request
        Reserve.put(":id", use: update)
        Reserve.delete(":id", use: delete)
        
    }
    
    func index (req :Request) async throws -> String {
        return "Get all reservation"}
    
    func create (req :Request) async throws -> String {
        return " create new reservation"}
    
    
    func update (req :Request) async throws -> String {
        let id = req.parameters.get("id")!
        return "update  reservation with  \(id)"}
    
    func delete (req :Request) async throws -> String {
        let id = req.parameters.get("id")!
        return "delete reservation with  \(id)"}
    
  
    
    
}
