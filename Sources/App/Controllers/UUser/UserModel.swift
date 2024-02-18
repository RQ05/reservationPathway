//
//  File.swift
//  
//
//  Created by Reyouf Alqahtani on 08/08/1445 AH.
//

import Foundation
import Fluent
import Vapor
final class UserModel :Model,Content {
 
    static let schema = "users"
    @ID(key:.id)
    var id : UUID?
    
    @Field(key:"Username")
    var Username:String
    
    @Field(key:"Email")
    var Email:String
    
    @Field(key:"Role")
    var Role:String//supposed to be Enum but we will ask the mintor first.
    init(){}
    init(id:UUID?=nil,Username:String, Email:String,Role:String){
        self.id=id
        self.Email = Email
        self.Username=Username
        self.Role=Role
    } // adding the columns in the database 

    
    
    
    
    
}
