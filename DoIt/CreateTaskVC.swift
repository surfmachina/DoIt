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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addbuttontapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = TaskNameTextField.text!
        task.important = ImportantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
        
    }
    
}
