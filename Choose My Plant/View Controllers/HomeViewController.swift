//
//  HomeViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 18/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var plantButton: UIButton!
    
    @IBOutlet weak var changingLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var wishlistButton: UIButton!
    
    @IBOutlet weak var saveToWislistButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://trefle.io/api/v1/plants?token=eZhnRapssn1kw4iLywcTrjytEYdBq1QAkuy8Mabe3tg"
        getData(from: url)
    }
    
    var plantArray = [String]()
    
     func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: Response?
            do {

                let result = try JSONDecoder().decode(Response.self, from: data)
                
                for plant in result.data { self.plantArray.append(plant.common_name) }
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
                }
                var data:[Plant]
            }
            })
        
            task.resume()

    }
    
    
    @IBAction func plantButtonTapped(_ sender: Any) {
        changingLabel.text = plantChooser()
        }
        func plantChooser() -> String {
        return (plantArray.randomElement()!)
    }
    
    
    @IBAction func saveToWishlistButtonTapped(_ sender: Any) {
    }
}


