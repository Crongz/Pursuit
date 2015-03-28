//
//  RecruitSignUpDetailViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/13/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import Parse

class RecruitSignUpDetailViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {


    
    var username: NSString = ""
    var userpassword: NSString = ""
    var userphone: NSString = ""
    var userfirstname: NSString = ""
    var userlastname: NSString = ""
    var usercompanyname: NSString = ""
    var usercompanydesciption: NSString = ""
    var usercompanylocation: NSString = ""
    var usercompanylogo : UIImage?


    @IBOutlet var usergpa: UITextField!
    @IBOutlet var useryears: UITextField!
    @IBOutlet var userskill1: UITextField!
    @IBOutlet var userskill2: UITextField!
    @IBOutlet var userskill3: UITextField!
    @IBOutlet var usermajor: UITextField!
    @IBOutlet var userdegree: UITextField!



    
    @IBAction func finish(sender:UIButton)
    {
        var user = PFUser()
        user.username = username
        user.password = userpassword
        user.email = username
        user["Phone"] = userphone
        //user["Gender"] = ""
        user["Location"] = usercompanylocation
        //user["Birthday"] = ""
        user["Firstname"] = userfirstname
        user["Lastname"] = userlastname
        user["GPA"] = usergpa.text
        user["Company"] = usercompanyname
        user["Years"] = useryears.text
        user["Skill1"] = userskill1.text
        user["Skill2"] = userskill2.text
        user["Skill3"] = userskill3.text
        user["Major"] = usermajor.text
        //user["School"] = userschool.text
        user["Degree"] = userdegree.text
        user["Description"] = usercompanydesciption
        user["Type"] = "Recruit"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                println("Signed up")
            } else {
                let errorString = error.description
                println(errorString)
                // Show the errorString somewhere and let the user try again.
            }
        }
   
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}