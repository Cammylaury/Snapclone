//
//  SnapsViewController.swift
//  SnapClone
//
//  Created by Cameron Laury on 3/11/18.
//  Copyright © 2018 Cameron Laury. All rights reserved.
//

import UIKit
import FirebaseAuth

class SnapsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        try? Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
}
