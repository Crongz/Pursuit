//
//  Data.swift
//  Pursuit
//
//  Created by George Ruan on 3/8/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation

public class Data {
    
    /* Public
    ========================================*/
    
    /* Get Functions 
    ----------------------------------------*/
    public func getUsername() -> String
    {
        return username!
    }
    
    public func getPassword() -> String
    {
        return password!
    }
    
    public func getFirstName() -> String
    {
        return firstName!
    }
    
    public func getlastName() -> String
    {
        return lastName!
    }
    
    public func getGpa() -> Double
    {
        return gpa!
    }
    
    public func getMajor() -> String
    {
        return major!
    }
    
    public func getDegree() -> String
    {
        return degree!
    }
    
    public func getSkills() -> [String]
    {
        return skills!
    }
    
    public func getMatches() -> [String]
    {
        return matches!
    }
    
    public func getRadius() -> Double
    {
        return radius!
    }
    
    public func getPayRange() -> Double
    {
        return payRange!
    }
    
    /* Set Functions 
    ----------------------------------------*/
    public func setUsername(username:String)
    {
        return self.username = username
    }
    
    public func setPassword(password:String)
    {
        return self.password = password
    }
    
    public func setFirstName(firstName:String)
    {
        return self.firstName = firstName
    }
    
    public func setLastName(lastName:String)
    {
        return self.lastName = lastName
    }
    
    public func setGpa(gpa:Double)
    {
        return self.gpa = gpa
    }
    
    public func setMajor(major:String)
    {
        return self.major = major
    }
    
    public func setDegree(degree:String)
    {
        return self.degree = degree
    }
    
    public func setSkills(skills:[String])
    {
        return self.skills = skills
    }
    
    public func setMatches(matches:[String])
    {
        return self.matches = matches
    }
    
    public func setRadius(radius:Double)
    {
        return self.radius = radius
    }
    
    public func setPayRange(payRange:Double)
    {
        return self.payRange = payRange
    }
    
    /* Private 
    ========================================*/
    
   
    /* Class Variables
    ----------------------------------------*/
    
    private var username:String?
    private var password:String?
    private var firstName:String?
    private var lastName:String?
    
    private var gpa:Double?
    private var major:String?
    private var degree:String?
    private var skills:[String]?
    private var matches:[String]?
    
    private var radius:Double?
    private var payRange:Double?
    
    /*!! Any variables past this list need an public GET and SET method to call !! */
    
    /* Initializers
    ----------------------------------------*/
    
    /* Default */
    init() {}
    
    /* Initialize values as well 
     * Not sure if we need this one */
    init(username: String, password:String, firstName:String, lastName:String,
        gpa:Double, major:String, degree:String, skills:[String], matches:[String],
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