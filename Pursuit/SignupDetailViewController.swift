//
//  SignupDetailViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/12/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//



import Foundation
import UIKit
import Parse

class SignupDetailViewController: UITableViewController {
    @IBOutlet var userfirst: UITextField!
    @IBOutlet var userlast: UITextField!
    @IBOutlet var usergpa: UITextField!
    @IBOutlet var usercompany: UITextField!
    @IBOutlet var useryears: UITextField!
    @IBOutlet var userskill1: UITextField!
    @IBOutlet var userskill2: UITextField!
    @IBOutlet var userskill3: UITextField!
    @IBOutlet var usermajor: UITextField!
    @IBOutlet var userschool: UITextField!
    @IBOutlet var userdegree: UITextField!
        
    var username: NSString = ""
    var userphone: NSString = ""
    var userpassword: NSString = ""
    var usergender: NSString = ""
    var userlocation: NSString = ""
    var userbirthday: NSString = ""
    
    
    // using Add
    @IBAction func addPhoto(sender: AnyObject) {
        let actionSheetController: UIAlertController = UIAlertController()
    
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)

        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
        }
        actionSheetController.addAction(takePictureAction)
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
        }
        actionSheetController.addAction(choosePictureAction)
        
        actionSheetController.popoverPresentationController?.sourceView = sender as UIView;
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func create(sender:UIButton)
    {
        var user = PFUser()
        user.username = username
        user.password = userpassword
        user.email = username
        user["Phone"] = userphone
        user["Gender"] = usergender
        user["Location"] = userlocation
        user["Birthday"] = userbirthday
        user["Firstname"] = userfirst.text
        user["Lastname"] = userlast.text
        user["GPA"] = usergpa.text
        user["Company"] = usercompany.text
        user["Years"] = useryears.text
        user["Skill1"] = userskill1.text
        user["Skill2"] = userskill2.text
        user["Skill3"] = userskill3.text
        user["Major"] = usermajor.text
        user["School"] = userschool.text
        user["Degree"] = userdegree.text
        
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
    
    @IBAction func backgroudtap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
}