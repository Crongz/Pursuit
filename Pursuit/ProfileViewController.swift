//
//  ProfileViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/3/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import Parse

class ProfileViewController: UITableViewController {
    
    @IBOutlet var username: UILabel!
    @IBOutlet var userpassword :UILabel!
    @IBOutlet var userfirst: UILabel!
    @IBOutlet var userlast: UILabel!
    @IBOutlet var usergpa: UILabel!
    @IBOutlet var usercompany: UILabel!
    @IBOutlet var useryears: UILabel!
    @IBOutlet var userbirthday: UILabel!
    @IBOutlet var usergender: UILabel!
    @IBOutlet var userskill1: UILabel!
    @IBOutlet var userskill2: UILabel!
    @IBOutlet var userskill3: UILabel!
    @IBOutlet var userphone: UILabel!
    @IBOutlet var usermajor: UILabel!
    @IBOutlet var userschool: UILabel!
    @IBOutlet var userdegree: UILabel!
    @IBOutlet var userlocation: UILabel!
    var currentUser = PFUser.currentUser()
    
    override func viewDidLoad() {
        username.text=currentUser.username;
        userpassword.text=currentUser.password;
        //userfirst.text=currentUser["Firstname"] as? String;
        //userlast.text=currentUser["Lastname"]  as? String;
        //usergpa.text=currentUser["GPA"] as? String;
        //usercompany.text=currentUser["Company"] as? String;
        //useryears.text=currentUser["Years"] as? String;
        userbirthday.text=currentUser["Birthday"] as? String;
        usergender.text=currentUser["Gender"] as? String;
//        userskill1.text=currentUser["Skill1"] as? String;
//        userskill2.text=currentUser["Skill2"] as? String;
//        userskill3.text=currentUser["Skill3"] as? String;
        userphone.text=currentUser["Phone"] as? String;
//        usermajor.text=currentUser["Major"] as? String;
//        userschool.text=currentUser["School"] as? String;
//        userdegree.text=currentUser["Degree"] as? String;
        userlocation.text=currentUser["Location"] as? String;
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCounterSegue" {
        }
    }
    override func viewWillAppear(Bool) {
        
    }

}