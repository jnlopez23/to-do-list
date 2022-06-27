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
}
