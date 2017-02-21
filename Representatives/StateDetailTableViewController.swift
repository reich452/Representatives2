//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Nick Reichard on 2/20/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
                self.representatives = representatives
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return representatives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toRepTVC", for: indexPath) as? RepresentativeTableViewCell ?? RepresentativeTableViewCell()
        
        cell.representative = representatives[indexPath.row]
        
        return cell
    }
    
    // MARK: - Properties
    
    // Add a computed property of type [Representative] that will be used to populate the Table View. Set it to an empty array to satisfy the requirement that all properties have values upon initialization and in the didSet reload the table view.
    
    var state: String?
    var representatives: [Representative] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
}
