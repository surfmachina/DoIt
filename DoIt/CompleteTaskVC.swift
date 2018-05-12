//
//  CompleteTaskVC.swift
//  DoIt
//
//  Created by Thomas Carlson on 12/5/18.
//  Copyright © 2018 SurfMachina. All rights reserved.
//

import UIKit

class CompleteTaskVC: UIViewController {

    var task : Task? = nil
    var previousVC = TaskViewController()
    
    @IBOutlet weak var tasklabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if task!.important {
            tasklabel.text = "👁\(task!.name!)"
        } else {
            tasklabel.text = task!.name!
            
        }
        
        
    }

    @IBAction func CompleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
