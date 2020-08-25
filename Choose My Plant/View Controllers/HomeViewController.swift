//
//  HomeViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage


class HomeViewController: UIViewController {

    @IBOutlet weak var plantButton: UIButton!
    
    @IBOutlet weak var changingLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var wishlistButton: UIButton!
    
    @IBOutlet weak var saveToWislistButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://trefle.io/api/v1/plants?token=eZhnRapssn1kw4iLywcTrjytEYdBq1QAkuy8Mabe3tg"
        getData(from: url)
    }
    
    
    var plantArray = [String]()
    var imageArray = [String]()
    
     func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: Response?
            do {

                let result = try JSONDecoder().decode(Response.self, from: data)

                for plant in result.data { self.plantArray.append( plant.common_name ); self.imageArray.append( plant.image_url)
                }
            }
                
            catch {
                debugPrint(error)
            }
            
            guard result != nil else {
                return
            }
           
            struct Response: Codable {
                struct Plant: Codable {
                    var common_name:String
                    var image_url:String
                }
                var data:[Plant]
            }

            })
        
            task.resume()

    }
    var select = String()
    var array = [String]()
    var selectedArray = [String]()
    
    @IBAction func plantButtonTapped(_ sender: Any) {

        changingLabel.text = plantChooser()
        imageView.sd_setImage(with: URL(string: "\(selectedArray[1])"))
       
    }
    
    func plantChooser() -> String {
        
        for (name, image) in zip(plantArray, imageArray) {
            array.append(contentsOf: ["\(name),\(image)"])
            select = array.randomElement()!

        }
          selectedArray = select.components(separatedBy: ",")
          return(selectedArray[0])

        }

    
    @IBAction func saveToWishlistButtonTapped(_ sender: Any) {
        let db = Firestore.firestore()
        db.collection("users/JldiJEK5i84DZWhlTFg6/wishlist").addDocument(data: ["plant" : selectedArray[0], "image" : selectedArray[1]])
    
    }

}
