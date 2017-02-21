//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Nick Reichard on 2/20/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return States.all.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = States.all[indexPath.row]
        
        cell.textLabel?.text = state
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewContorller = segue.destination as? StateDetailTableViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row {
            
            let state = States.all[selectedIndex]
            destinationViewContorller.state = state 
        }
        
    }
}
