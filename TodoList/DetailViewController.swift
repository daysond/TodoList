//
//  DetailViewController.swift
//  TodoList
//
//  Created by Dayson Dong on 2019-06-05.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var completeSwitch: UISwitch!
    var appDelegte: AppDelegate!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                let p = detail.priorityNumber!
                let t = detail.title!
                let d = detail.todoDescription!
                label.text = "\(p) - \(t)\n\(d)"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appDelegte = UIApplication.shared.delegate as? AppDelegate
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let isCompleted = detailItem?.isCompleted {
            completeSwitch.setOn(isCompleted, animated: true)
        }
        
    }

    var detailItem: ToDo? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
       
        detailItem?.isCompleted = completeSwitch.isOn
        appDelegte.saveContext()
    }
    
}

