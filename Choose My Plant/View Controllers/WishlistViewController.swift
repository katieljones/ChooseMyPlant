//
//  WishlistViewController.swift
//  Choose My Plant
//
//  Created by Katie Jones on 21/08/2020.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit
import Firebase

class WishlistViewController: UIViewController {

    
    @IBOutlet weak var chagingTextView: UITextView!
    
    @IBOutlet weak var showMeButton: UIButton!
    
    private var names = [String]()
    private var images = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
     
    override func viewWillAppear(_ animated: Bool) {
         let db = Firestore.firestore()
        db.collection("users/JldiJEK5i84DZWhlTFg6/wishlist").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                print(querySnapshot?.documents)
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["plant"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let documentId = document.documentID
                    print(name)
                    print(image)
                    self.names.append(name)
                    self.images.append(image)

                  
      
                }
            }
        }
    }
    
    
    @IBAction func showMeButtonTapped(_ sender: Any) {
        chagingTextView.text = printPlant()
    }
    var name = String()
    
    func printPlant() -> String {
        for i in names {
        name = "\(i)"
    }
        return(name)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
