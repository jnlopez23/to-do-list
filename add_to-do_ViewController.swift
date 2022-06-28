//
//  add_to-do_ViewController.swift
//  to do list
//
//  Created by Scholar on 6/28/22.
//

import UIKit

class add_to_do_ViewController: UIViewController {

    var previousVC = to_do_list_TableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
     @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let toDo = To_Do()

        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
          }
          previousVC.to_dos.append(toDo)
          previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
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
