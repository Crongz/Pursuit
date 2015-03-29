

//
//  ProfileEditViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/3/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import Parse

class P_ProfileEditViewController: UITableViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var userpassword :UITextField!
    @IBOutlet var userfirst: UITextField!
    @IBOutlet var userlast: UITextField!
    @IBOutlet var usergpa: UITextField!
    @IBOutlet var usercompany: UITextField!
    @IBOutlet var useryears: UITextField!
    @IBOutlet var userbirthday: UITextField!
    @IBOutlet var usergender: UITextField!
    @IBOutlet var userskill1: UITextField!
    @IBOutlet var userskill2: UITextField!
    @IBOutlet var userskill3: UITextField!
    @IBOutlet var userphone: UITextField!
    @IBOutlet var usermajor: UITextField!
    @IBOutlet var userschool: UITextField!
    @IBOutlet var userdegree: UITextField!
    @IBOutlet var userlocation: UITextField!
    var currentUser = PFUser.currentUser()

    override func viewDidLoad() {
        
        username.text=currentUser.username;
        userpassword.text=currentUser.password;
        userfirst.text=currentUser["Firstname"] as? String;
        userlast.text=currentUser["Lastname"]  as? String;
        usergpa.text=currentUser["GPA"] as? String;
        usercompany.text=currentUser["Company"] as? String;
        useryears.text=currentUser["Years"] as? String;
        userbirthday.text=currentUser["Birthday"] as? String;
        usergender.text=currentUser["Gender"] as? String;
        userskill1.text=currentUser["Skill1"] as? String;
        userskill2.text=currentUser["Skill2"] as? String;
        userskill3.text=currentUser["Skill3"] as? String;
        userskill1.text=currentUser["Phone"] as? String;
        usermajor.text=currentUser["Major"] as? String;
        userschool.text=currentUser["School"] as? String;
        userdegree.text=currentUser["Degree"] as? String;
        userlocation.text=currentUser["Location"] as? String;
    }
    
    @IBAction func update(sender:UIButton)
    {
        currentUser.username = username.text
        currentUser.password = userpassword.text
        currentUser["Firstname"] = userfirst.text
        currentUser["Lastname"] = userlast.text
        currentUser["GPA"] = usergpa.text
        currentUser["Company"] = usercompany.text
        currentUser["Years"] = useryears.text
        currentUser["Birthday"] = userbirthday.text
        currentUser["Gender"] = usergender.text
        currentUser["Skill1"] = userskill1.text
        currentUser["Skill2"] = userskill2.text
        currentUser["Skill3"] = userskill3.text
        currentUser["Phone"] = userphone.text
        currentUser["Major"] = usermajor.text
        currentUser["School"] = userschool.text
        currentUser["Degree"] = userdegree.text
        currentUser["Location"] = userlocation.text
        
        /* save to local ========================================*/
//        PFUser.currentUser().pinInBackgroundWithBlock{
//            (succeeded: Bool!, error: NSError!) -> Void in
//            if error == nil {
//                println("Pined into background")
//            } else {
//                let errorString = error.description
//                println(errorString)
//            }
//        }
//      PFUser.currentUser().fetchFromLocalDatastore()
        
        PFUser.currentUser().save()
//      PFUser.currentUser().fetch()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}