//
//  Representative.swift
//  Representatives
//
//  Created by Nick Reichard on 2/20/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class Representative {
    
    private let nameKey = "name"
    private let partyKey = "party"
    private let stateKey = "state"
    private let districtKey = "district"
    private let phoneKey = "phone"
    private let officeKey = "office"
    private let linkKey = "link"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init?(JSONdictionary: [String: Any]) {
        guard let name = JSONdictionary[nameKey] as? String,
            let party = JSONdictionary[partyKey] as? String,
            let state = JSONdictionary[stateKey] as? String,
            let district = JSONdictionary[districtKey] as? String,
            let phone = JSONdictionary[phoneKey] as? String,
            let office = JSONdictionary[officeKey] as? String,
            let link = JSONdictionary[linkKey] as? String else { return nil }
        
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
    
    
    
}
