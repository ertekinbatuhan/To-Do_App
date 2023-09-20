//
//  UpdateTaskViewController.swift
//  To-Do App
//
//  Created by Batuhan Berk Ertekin on 2.09.2023.
//

import UIKit

class UpdateTaskViewController: UIViewController
{
    let context = appDelegate.persistentContainer.viewContext
    var task : Tasks?
    
    @IBOutlet weak var updateTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        if let isTaskEmpty = task
        {
            updateTextField.text = isTaskEmpty.task_name
        }
        
        updateTextField.layer.cornerRadius = 8
        updateTextField.layer.masksToBounds = true
        
        
    }
    
    @IBAction func updateButton(_ sender: Any)
    {
        if let isTaskEmpty = task
        {
            isTaskEmpty.task_name = updateTextField.text
            appDelegate.saveContext()
            performSegue(withIdentifier: "updateTask", sender: nil)
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
