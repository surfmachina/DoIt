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
    var selectedindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        tableview.dataSource = self
        tableview.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        
        if task.important {
            cell.textLabel?.text = "👁\(task.name)"
        } else {
            cell.textLabel?.text = task.name
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedindex = indexPath.row
        performSegue(withIdentifier: "selecttasksegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the Dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Milk"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Buy Cheese"
        task3.important = true
        
        return [task1,task2,task3]
    }

    @IBAction func plustapped(_ sender: Any) {
        performSegue(withIdentifier: "addsegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addsegue"{
            let nextVC = segue.destination as! CreateTaskVC
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selecttasksegue"{
            let nextVC = segue.destination as! CompleteTaskVC
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }
}

