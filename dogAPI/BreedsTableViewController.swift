

import UIKit

class BreedsTableViewController: UITableViewController {

    var breeds: [String:[String]] = [:]
    var keys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Task{
            do{
                self.breeds = try await DogAPI_Helper.fetchBreeds()
                self.keys = breeds.keys.sorted(by: <)
//                let breedKeys = breeds.keys.sorted(by: <)
                                
//                for breed in breedKeys{
//                    if breeds[breed]!.isEmpty {
////                        print("adding breed \(breed)")
//                        self.breeds[breed] = nil
//                        self.keys.append(breed)
//                    } else {
//                        for subbreed in breeds[breed]! {
////                            print("adding subbreed \(subbreed) of \(breed)")
//                            self.breeds[subbreed] = breed
//                            self.keys.append(subbreed)
//                        }
//                    }
//                }
                
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let err{
                print("something went wrong: \(err)")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return breeds.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var numberOfSubbreed = 1
        if breeds[keys[section]]!.count>0 {
            numberOfSubbreed = breeds[keys[section]]!.count + 1
        }
        
        return numberOfSubbreed
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breed", for: indexPath) as! SubbreedTableViewCell

        // Configure the cell...
        let breed = keys[indexPath.section]
        if breeds[breed]!.count > 0
            && indexPath.row != 0{
            cell.breedName.text = "\(breed):"
            cell.subBreedName.text = breeds[breed]![indexPath.row-1]
        
        } else {
            cell.breedName.text = breed
            cell.subBreedName.alpha = 0
            
        }
        
        
//        if let breed = breeds[keys[indexPath.row]]{
//            print(keys[indexPath.row])
//            cell.subBreedName.alpha = 1
//            cell.subBreedName.text = keys[indexPath.row]
//            cell.breedName.text = "\(breed!):"
//        } else {
//            cell.breedName.text = keys[indexPath.row]
//            cell.subBreedName.alpha = 0
//        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
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
