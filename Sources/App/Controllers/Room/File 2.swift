//
//  File 2.swift
//  
//
//  Created by Reyouf Alqahtani on 08/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
final class RoomModel :Model,Content {
 
    static let schema = "rooms"
    @ID(key:.id)
    var id : UUID?
    
    @Field(key:"RoomName")
    var RoomName:String
    
    @Field(key:"Discription")
    var Discription:String
    
    @Field(key:"Equipent")
    var Equipent:String
    @Field(key:"Capacity")
    var Capacity:Int
    
    @Field(key:"Availability")
    var Availability:Bool
      
    init(){}
    init(id:UUID?=nil,Username:String, Email:String,Role:String){
      //  self.id
    } // adding the columns in the database

    
    
    
    
    
}
