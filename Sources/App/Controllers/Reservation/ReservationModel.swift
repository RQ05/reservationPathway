//
//  File.swift
//  
//
//  Created by Hasna Ahmad on 08/08/1445 AH.
//
import Foundation
import Fluent
import Vapor

final class ReservationModel :Model,Content {
    
    static let schema = "reserve"
    @ID(key:.id)
    var id : UUID?
    
    @Field(key:"roomID")
    var RoomID:UUID
    
    @Field(key:"userID")
    var userID:UUID
    
    @Field(key:"startDate")
    var startDate : Date
    
    @Field(key:"hours")
    var hours : String
    
    @Field(key:"reservationStatus")
    var reservationStatus : String
    
    init(){}
    init(id : UUID? = nil , roomID : UUID , userID : UUID , startDate : Date , hours : String, reservationStatus : String){
        
        self.id = id
        self.RoomID = roomID
        self.userID = userID
        self.startDate = startDate
        self.hours = hours
        self.reservationStatus = reservationStatus
        
        

    } // adding the columns in the database
}
