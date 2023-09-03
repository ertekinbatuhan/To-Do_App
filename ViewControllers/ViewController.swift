//
//  ViewController.swift
//  To-Do App
//
//  Created by Batuhan Berk Ertekin on 2.09.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController
{
    var isSearching  = false
    var searchWord : String?
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var taskSearchBar: UISearchBar!
    
    @IBOutlet weak var taskTableView: UITableView!
    var stringlist = [String]()
    var tasksList = [Tasks]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stringlist = ["batuhan","berk"]
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskSearchBar.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if isSearching
        {
            getSearch(searchName: searchWord!)
        } else
        {
            getAllTasks()
        }
    
        taskTableView.reloadData()
    }
    
    func getAllTasks()
    {
        do
        {
            tasksList = try context.fetch(Tasks.fetchRequest())
            
        } catch
        {
            print(error)
        }
    }
    
    func getSearch(searchName : String)
    {
        let fetchRequest : NSFetchRequest<Tasks> = Tasks.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "task_name CONTAINS %@", searchName)
        
        do
        {
            tasksList = try context.fetch(fetchRequest)
             
        } catch
        {
            print(error)
        }
    }
}
    

extension ViewController : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "task") as! TaskTableViewCell
        cell.taskNameLabel.text = tasksList[indexPath.row].task_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
     
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let index = sender as? Int
        
        if segue.identifier == "toUpdateTask" {
            let destination = segue.destination as! UpdateTaskViewController
            
            destination.task = tasksList[index!]
            
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {
            (action : UITableViewRowAction , indexPath : IndexPath) -> Void in
            
            let deleteTask = self.tasksList[indexPath.row]
            self.context.delete(deleteTask)
            appDelegate.saveContext()
            
            self.getAllTasks()
            
            tableView.reloadData()
            
        })
        
        let updateAction = UITableViewRowAction(style: .normal, title: "Update", handler: {
            (action : UITableViewRowAction , indexPath : IndexPath) -> Void in
            
            self.performSegue(withIdentifier: "toUpdateTask", sender: indexPath.row)
        
        })
        
        return [deleteAction,updateAction]
    }
}

extension ViewController : UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
       
       searchWord = searchText
        
        if searchText == ""
        {
            isSearching = false
            getAllTasks()
            
        } else
        {
            isSearching = true
            self.getSearch(searchName: searchWord!)
        }
        
        taskTableView.reloadData()
        }
}




    


