//
//  SignUpViewController.swift
//  Checkers
//
//  Created by William McDuff on 2015-02-17.
//  Copyright (c) 2015 Cal. All rights reserved.
//

import UIKit
import SpriteKit


class LoginViewController: UIViewController, SignedInProtocol {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        User.currentUser().delegate2 = self
       
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
        if let token = User.currentUser().token {
            
        
  
           self.goToApp()
            
        
        }

    }
  
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    @IBAction func logIn(sender: AnyObject) {
        
        
        var message = ""
        
        if emailField.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 0 {
            message = "Please provide email"
        }
        
        if passwordField.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 0 {
            message = "Please provide password"
        }
        
        
        if message.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) != 0 {
            var alert:UIAlertView = UIAlertView(title: "Message", message: message, delegate: nil, cancelButtonTitle: "Ok")
            
            alert.show()
        }
            
        else {
            User.currentUser().login(emailField.text, password: passwordField.text)
        }
        
        
    }
    
    func goToApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewControllerWithIdentifier("gameBV") as ViewController
        
        
    
        storyboard.instantiateViewControllerWithIdentifier("gameBV")
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.presentViewController(vc, animated: true, completion: nil)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = vc
    }
    
    func signInUnsuccesful(error: String) {
        var alert:UIAlertView = UIAlertView(title: "SignIn Unsuccesful", message: error, delegate: nil, cancelButtonTitle: "Ok")
        
        alert.show()
    }
    
    
}
