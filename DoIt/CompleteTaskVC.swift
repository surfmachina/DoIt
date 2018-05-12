//
//  CompleteTaskVC.swift
//  DoIt
//
//  Created by Thomas Carlson on 12/5/18.
//  Copyright © 2018 SurfMachina. All rights reserved.
//

import UIKit

class CompleteTaskVC: UIViewController {

    var task = Task()
    var previousVC = TaskViewController()
    
    @IBOutlet weak var tasklabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if task.important {
            tasklabel.text = "👁\(task.name)"
        } else {
            tasklabel.text = task.name
            
        }
        
        
    }

    @IBAction func CompleteTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedindex)
        previousVC.tableview.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
