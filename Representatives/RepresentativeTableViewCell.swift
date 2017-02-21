//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Nick Reichard on 2/20/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        representative = nil
    }
    
   private func updateViews() {
        
        guard let representative = representative else { return }
        
        repsNameLable.text = representative.name
        partyLable.text = representative.party
        districtLable.text = representative.district
        websiteLabe.text = representative.link
        phoneNumberLable.text = representative.phone
        
    }
    
    
    
    
    // MARK: - Properties
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var repsNameLable: UILabel!
    @IBOutlet weak var partyLable: UILabel!
    @IBOutlet weak var districtLable: UILabel!
    @IBOutlet weak var websiteLabe: UILabel!
    @IBOutlet weak var phoneNumberLable: UILabel!
    
}
