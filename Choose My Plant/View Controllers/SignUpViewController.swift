//
//  SignUpViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var
      nameTextField:
      UITextField!
    
    @IBOutlet weak var
      emailTextField:
      UITextField!
    
    @IBOutlet weak var
      passwordTextField:
      UITextField!
    
    @IBOutlet weak var
      signUpButton:
      UIButton!
    
    
    @IBOutlet weak var
      errorLabel:
      UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        return nil
        
    }

 

    @IBAction func signUpTapped(_ sender: Any) {
        
        
        
    }
}
