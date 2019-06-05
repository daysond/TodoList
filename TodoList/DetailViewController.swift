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
        configureView()
    }

    var detailItem: ToDo? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

