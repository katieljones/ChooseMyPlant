import Foundation
import Firebase
import UIKit
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
