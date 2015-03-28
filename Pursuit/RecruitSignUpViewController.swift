//
//  RecruitSignUpViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/13/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import Parse

class RecruitSignUpViewController: UITableViewController {

    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtFirstname : UITextField!
    @IBOutlet var txtLastname : UITextField!
    @IBOutlet var txtPhone : UITextField!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /** send information to next view **/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "recruit_signup_success") {
            var svc = segue.destinationViewController as RecruitCompanyViewController;
            svc.username = txtUsername.text.lowercaseString
            svc.userpassword = txtPassword.text
            svc.userfirstname = txtFirstname.text
            svc.userlastname = txtLastname.text
            svc.userphone = txtPhone.text

            
            
        }
    }
    
    
    @IBAction func cancel(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func submit(sender:UIButton)
    {
        var query = PFUser.query()
        query.whereKey( "username" , equalTo: txtUsername.text)
        var overlap = query.findObjects()
        println(overlap);
        if(overlap.count == 0)
        {
            self.performSegueWithIdentifier("recruit_signup_success", sender: self)
        }
        else
        {
            let alertVC = UIAlertController(title: "Invaild ID", message: "Sorry, this ID is taken", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            alertVC.addAction(okAction)
            presentViewController(alertVC, animated: true, completion: nil)
        }
        
    }
    

}