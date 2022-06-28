//
//  to_do_list_TableViewController.swift
//  to do list
//
//  Created by Scholar on 6/27/22.
//

import UIKit

class to_do_list_TableViewController: UITableViewController {
    
    var to_dos : [To_Do] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        to_dos = create_to_dos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }//end of VIEW DID LOAD FUNCTION
    
    func create_to_dos() -> [To_Do]{
        
        let swift = To_Do()
        swift.name = "learn swift"
        swift.important = true
        
        
        let dog = To_Do()
        dog.name = "wall the dog"
        dog.important = true
        //important is set to false by default
        
        return [swift, dog]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return to_dos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

          let toDo = to_dos[indexPath.row]
        
        if toDo.important{
            cell.textLabel?.text = "🦎" + toDo.name
        }else{
            cell.textLabel?.text = toDo.name
        }
          return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = to_dos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
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

        
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? add_to_do_ViewController {
        addVC.previousVC = self
      }

      if let completeVC = segue.destination as? CompleteToDoViewController {
        if let toDo = sender as? To_Do {
          completeVC.selectedToDo = toDo
          completeVC.previousVC = self
        }
      }
    }
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        







