//
//  RecruitCompanyViewController.swift
//  Pursuit
//
//  Created by James Lee on 3/23/15.
//  Copyright (c) 2015 Pursuit. All rights reserved.
//

import Foundation
import UIKit
import Parse

class RecruitCompanyViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var username: NSString = ""
    var userpassword: NSString = ""
    var userphone: NSString = ""
    var userfirstname: NSString = ""
    var userlastname: NSString = ""
    
    @IBOutlet var companyname: UITextField!
    @IBOutlet var companydesciption: UITextView!
    @IBOutlet var companylocation: UITextField!
    @IBOutlet weak var myLogoView: UIImageView!
    
    
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
        myLogoView.image = chosenImage
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "recruit_next") {
            var svc = segue.destinationViewController as RecruitSignUpDetailViewController;
            svc.username = self.username
            svc.userpassword = self.userpassword
            svc.userphone = self.userphone
            svc.userfirstname = self.userfirstname
            svc.userlastname = self.userlastname
            svc.usercompanyname = companyname.text
            svc.usercompanydesciption = companydesciption.text
            svc.usercompanylocation = companylocation.text
            //svc.usercompanylogo = myLogoView.image
        }
    }

    
    @IBAction func next(sender:UIButton)
    {
        self.performSegueWithIdentifier("recruit_next", sender: self)
K
    }
    
    @IBAction func cancel(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}