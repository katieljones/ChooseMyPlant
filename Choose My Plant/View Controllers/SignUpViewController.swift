//
//  SignUpViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
    }
    
    func validateFields() -> String? {
        
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
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

    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            
            let name = nameTextField.text!.trimmingCharacters(in:
                .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in:
            .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in:
            .whitespacesAndNewlines)
             //create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name":name, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
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
        let ViewController =
            self.storyboard?.instantiateViewController(identifier:
                Constants.Storyboard.ViewController) as?
            ViewController
        
        self.view.window?.rootViewController = ViewController
        self.view.window?.makeKeyAndVisible()
    }
}
