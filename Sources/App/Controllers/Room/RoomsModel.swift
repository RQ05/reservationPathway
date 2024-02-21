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
    
    @Field(key:"Equipment")
    var Equipment:String
    
    @Field(key:"Capacity")
    var Capacity:Int
    
    @Field(key:"Availability")
    var Availability:Bool
    
    @Children(for: \.$room)
    var reservations: [ReservationModel]
      
    init(){}
    init(id:UUID? = nil ,RoomName:String , Discription :String, Equipment :String, Capacity :Int , Availability : Bool ){
        self.id = id
        self.RoomName = RoomName
        self.Discription = Discription
        self.Equipment = Equipment
        self.Capacity = Capacity
        self.Availability = Availability
    } // adding the columns in the database
}

/*
 "RoomName" :  "lab1",
 "Discription" : "backend room",
 "Equipment" : "screen",
  "Capacity" : 20,
 "Availability" : true
 
 */
