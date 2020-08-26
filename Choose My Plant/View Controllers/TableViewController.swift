//
//  TableViewController.swift
//  Choose My Plant
//
//  Created by Matthew Lock on 8/25/20.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {

    var db:Firestore!
    
    
    @IBOutlet var plantList: UITableView!
    
    var plantArray = [Plant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        loadData()
        checkForUpdates()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plantArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishlistItem", for: indexPath)
        
        let plant = plantArray[indexPath.row]
        
        cell.textLabel?.text = "\(plant.name): \(plant.image)"

        // Configure the cell...
        
        return cell
    }
    
    func loadData() {
    db.collection("users/JldiJEK5i84DZWhlTFg6/wishlist").getDocuments() {
        querySnapshot, error in
        if let error = error {
            print("\(error.localizedDescription)")
        }else{
            self.plantArray = querySnapshot!.documents.compactMap({Plant(dictionary: $0.data())})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    }
        func checkForUpdates() {
            db.collection("users/JldiJEK5i84DZWhlTFg6/wishlist")
            .addSnapshotListener {
                querySnapshot, error in
                
                guard let snapshot = querySnapshot else {return}
                
                snapshot.documentChanges.forEach {
                    diff in
                    
                    if diff.type == .added {
                        //self.plantArray.append(Plant(dictionary: diff.document.data())!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
    }
        
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
        /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


