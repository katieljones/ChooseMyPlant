////
////  Plant.swift
////  Choose My Plant
////
////  Created by Katie Jones on 20/08/2020.
////  Copyright © 2020 Katie Jones. All rights reserved.
////
//
import Foundation
import Firebase
import UIKit

//struct Plant: Codable {
//    var common_name:String?
//    var image_url:String?
//    
//}


protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}

struct Plant {
    var name: String
    var image: String
    
    var dictionary:[String:Any] {
        return [
            "name": name,
            "image" : image
        ]
    }
    
}

extension Plant : DocumentSerializable {
    init?(dictionary: [String : Any])  {
        guard let name = dictionary["name"] as? String,
            let image = dictionary["image"] as? String
            
            else {return nil};
        self.init(name: name, image: image)
    }
}
