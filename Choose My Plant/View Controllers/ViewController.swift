 //
//  ViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit
 import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var
      emailTextField:
      UITextField!
    
    
    @IBOutlet weak var passwordTextField:
        UITextField!
    
    @IBOutlet weak var
        loginButton:
        UIButton!
    
    
    @IBOutlet weak var
       signUpButton:
       UIButton!
    
    
    @IBOutlet weak var
       errorLabel:
       UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String? {
           
           if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
           {
               return "Please fill in all fields."
           }
           
           let cleanedPassword = passwordTextField.text!.trimmingCharacters(in:
               .whitespacesAndNewlines)
           if Utilities.isPasswordValid(password: cleanedPassword) == false {
               return "Please make sure your password is at least 8 characters long."
           }
           
           return nil
           
       }

    
    @IBAction func
        loginTapped(_ sender: Any) {
        
         let error = validateFields()
                
                if error != nil {
                    showError(error!)
                }
                else {
                    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                     let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                        if error != nil {
                            self.showError("Credentials do not match.")
                        }
                        else {
                            self.transitionToHome()
                        }
                    }
                }
                
            }
            
            func showError(_ message:String) {
                
                errorLabel.text = message
                errorLabel.alpha = 1
                
            }
    func transitionToHome() {
         let homeViewController =
            self.storyboard?.instantiateViewController(identifier:
                 Constants.Storyboard.homeViewController) as?
             HomeViewController
         
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
     }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
 }
