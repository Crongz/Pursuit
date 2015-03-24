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

class PursuitSignupDetailViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
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
    @IBOutlet weak var myImageView: UIImageView!

    
    var username: NSString = ""
    var userphone: NSString = ""
    var userpassword: NSString = ""
    var usergender: NSString = ""
    var userlocation: NSString = ""
    var userbirthday: NSString = ""
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
    }
    
   
    /** Adding Image to Profile **/
    @IBAction func addPhoto(sender: AnyObject) {
        let actionSheetController: UIAlertController = UIAlertController()
    
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)

        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
            self.shootPhoto()
        }
        actionSheetController.addAction(takePictureAction)
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Select photo from library", style: .Default) { action -> Void in
            self.photofromLibrary()
        }
        actionSheetController.addAction(choosePictureAction)
        
        actionSheetController.popoverPresentationController?.sourceView = sender as UIView;
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var chosenImage = info[UIImagePickerControllerOriginalImage] as UIImage
        myImageView.image = chosenImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func photofromLibrary() {
        picker.allowsEditing = true
        picker.sourceType = .PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
    }
    func shootPhoto() {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            alertVC.addAction(okAction)
            presentViewController(alertVC, animated: true, completion: nil)
        }
    }

    /** create new account **/
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
        user["Type"] = "Pursuit"
        
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