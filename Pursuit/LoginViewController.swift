//
//  ViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/3/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    
    @IBAction func log_in (sender : UIButton){
        println("button tapped!-login")

        /** for test **/
        
        PFUser.logInWithUsernameInBackground(txtUsername.text, password:txtPassword.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                
                // Determine if user is pursuiter or recruiter
                if(user["Type"] as NSString=="Pursuit")
                {
                    self.performSegueWithIdentifier("pursuit_login_success", sender: self)
                    println("Login success - pursuit");
                }
                else
                {
                    self.performSegueWithIdentifier("recruit_login_success", sender: self)
                    println("Login success - recruit");
                }
            } else {
                println("Login failed-login");
                // The login failed. Check error to see why.
            }
        }

        
    }
    
    @IBAction func backgroudtap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    override func viewDidLoad() {
        PFUser.logOut()
        var currentUser = PFUser.currentUser() // this will now be nil
        println(currentUser)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

