//
//  HomeViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var plantButton: UIButton!
    
    @IBOutlet weak var changingTextView: UITextView!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var wishlistButton: UIButton!
    
    @IBOutlet weak var saveToWislistButton: UIButton!
    
    
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
                print("This is an error")
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
    
    @IBAction func plantButtonTapped(_ sender: Any) {
        changingTextView.text = plantChooser()
        }
    func plantChooser() -> String {
        
        for (name, image) in zip(plantArray, imageArray) {
            array.append(contentsOf: ["\(name), \(image)"])
            select = array.randomElement()!

        }
                return(select)
        }
    
    var wishList = String()
    
    @IBAction func saveToWishlistButtonTapped(_ sender: Any) {
        self.wishList.append(select)
        print(wishList)
    }
}

