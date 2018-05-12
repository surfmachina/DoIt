//
//  TaskViewController.swift
//  DoIt
//
//  Created by Thomas Carlson on 11/5/18.
//  Copyright © 2018 SurfMachina. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        

        tableview.dataSource = self
        tableview.delegate = self
    }

    // runs everytime the screen shows up
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        
        if task.important {
            cell.textLabel?.text = "👁\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selecttasksegue", sender: task)
    }

    @IBAction func plustapped(_ sender: Any) {
        performSegue(withIdentifier: "addsegue", sender: nil)
    }
    
    func getTasks() {
        
        // get things from core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try tasks = context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("WE HAVE AN ERROR")
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if segue.identifier == "selecttasksegue"{
            let nextVC = segue.destination as! CompleteTaskVC
            nextVC.task = sender as? Task
        }
        
    }
}

