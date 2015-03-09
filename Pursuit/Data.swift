//
//  Data.swift
//  Pursuit
//
//  Created by George Ruan on 3/8/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation

class Data {
    
    /* Class Variables */
    var username:String?
    var password:String?
    var firstName:String?
    var lastName:String?
    
    var gpa:String?
    var major:String?
    var degree:String?
    var skills:[String]?
    var matches:[String]?
    
    var radius:Double?
    var payRange:Double?
    
    /* Initializer */
    init(username: String, password:String, firstName:String, lastName:String,
        gpa:String, major:String, degree:String, skills:[String], matches:[String],
        radius:Double, payRange:Double)
    {
        self.username = username
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        
        self.gpa = gpa
        self.major = major
        self.degree = degree
        self.skills = skills
        self.matches = matches
        
        self.radius = radius
        self.payRange = payRange
    }
}