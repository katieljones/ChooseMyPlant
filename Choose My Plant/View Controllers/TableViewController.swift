import UIKit
import Firebase

class TableViewController: UITableViewController {
    var db:Firestore!
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet var plantList: UITableView!
    
    var plantArray = [Plant]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        Firestore.firestore().collection("users/4IgLEzlV2RTqVyoMR8gAijz2Tdp2/wishlist").getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("Error retrieving documents: \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    let plant = data["plant"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let newPlant = Plant(name: plant, image: image)
                    self.plantArray.append(newPlant)
                }
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
                }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WishlistItem", for: indexPath)
            as? TableViewCell {
            cell.configureCell(plantArray: plantArray[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            plantArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //let plantID = indexPath.row
            //Firestore.firestore().collection("users/JldiJEK5i84DZWhlTFg6/wishlist").document("\(plantID)").delete()
        } else if editingStyle == .insert {
        }
        self.tableView.reloadData()
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
