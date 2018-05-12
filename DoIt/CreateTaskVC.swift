//
//  CreateTaskVC.swift
//  DoIt
//
//  Created by Thomas Carlson on 11/5/18.
//  Copyright © 2018 SurfMachina. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {

    @IBOutlet weak var TaskNameTextField: UITextField!
    
    @IBOutlet weak var ImportantSwitch: UISwitch!
    
    var previousVC = TaskViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addbuttontapped(_ sender: Any) {
        
        let task = Task()
        task.name = TaskNameTextField.text!
        task.important = ImportantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableview.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    
}
