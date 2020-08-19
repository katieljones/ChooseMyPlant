 //
//  ViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
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
    
    @IBAction func
        loginTapped(_ sender: Any) {
        
    }
    

}

