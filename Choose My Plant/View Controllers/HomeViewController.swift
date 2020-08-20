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
    
    
    @IBOutlet weak var changingTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://trefle.io/api/v1/plants?token=eZhnRapssn1kw4iLywcTrjytEYdBq1QAkuy8Mabe3tg"
        getData(from: url)
    }
    
    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
        
            }
            catch {
                debugPrint(error)
            }
            guard let json = result else {
                return
            
            }
            print(json.data)
            // save the data to an array
            // use this array to put the randomise method
            })
            
            task.resume()
    
        struct Response: Codable {
            var data:[MyResult]
            
        }
        struct MyResult: Codable {
            var common_name:String
        }
        
    }

    @IBAction func plantButtonTapped(_ sender: Any) {
        changingTextView.text = plantChooser()
    }
        
        func plantChooser() -> String {
             let plant = ["Winter Cherry", "Elephant Ears", "African Violet", "Beach Spider Lily", "Bird of Paradise", "Flaming Sword", "Lollipop Plant"]
             return (plant.randomElement()!)
        
        
    }
}


