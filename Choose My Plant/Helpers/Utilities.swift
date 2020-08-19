//
//  Utilities.swift
//  Choose My Plant
//
//  Created by Katie Jones on 19/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit

class Utilities {

    static func isPasswordValid( password : String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
          "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
