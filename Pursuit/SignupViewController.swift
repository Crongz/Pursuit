//
//  SignupViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/3/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import Parse

class SignupViewcontroller: UITableViewController {
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtBirthday : UITextField!
    @IBOutlet var txtGender : UITextField!
    @IBOutlet var txtPhone : UITextField!
    @IBOutlet var txtLocation : UITextField!
    
    @IBAction func cancel(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func submit(sender:UIButton){
        var user = PFUser()
        user.username = txtUsername.text
        user.password = txtPassword.text
        user.email=txtUsername.text
        // other fields can be set just like with PFObject
        //user["Firstname"] = "FirstName"
        //user["Lastname"] = "LastName"
        //user["GPA"]="0.0"
        //user["Company"]="Null"
        //user["Years"]="0"
        user["Birthday"]=txtBirthday.text
        user["Gender"]=txtGender.text
        //user["Skill1"]="Null"
        //user["Skill2"]="Null"
        //user["Skill3"]="Null"
        user["Phone"]=txtPhone.text
        //user["Major"]="Null"
        //user["School"]="Null"
        //user["Degree"]="Null"
        user["Location"]=txtLocation.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
                let errorString = error.description
                println(errorString)
                // Show the errorString somewhere and let the user try again.
            }
        }
        self.dismissViewControllerAnimated(true, completion: nil)

       
    }


}