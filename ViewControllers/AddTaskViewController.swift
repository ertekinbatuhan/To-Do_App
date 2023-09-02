//
//  AddTaskViewController.swift
//  To-Do App
//
//  Created by Batuhan Berk Ertekin on 2.09.2023.
//

import UIKit

class AddTaskViewController: UIViewController
{
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var addTaskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButton(_ sender: Any)
    {
        
        if let isTaskEmpty = addTaskTextField.text
        {
            let task = Tasks(context: context)
            task.task_name = isTaskEmpty
            appDelegate.saveContext()
            
            performSegue(withIdentifier: "addTask", sender: nil)
        }
        
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
