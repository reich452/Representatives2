//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Nick Reichard on 2/20/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void)  {
        
        // - Create and send request, and wait for repsonse
        
        guard let url = baseURL else { return }
        
        let urlParameters = ["state" : "\(state)", "output" : "json"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                print("Unable to get the representatives for: \(state), \(error)"); completion([])
                return
            }
            
            // takes the data and turns it into a string
            //- Handle data if there is any. Serialize the data into json objects.
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else
            { completion ([]); return }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else
            { completion([]); return }
            
            //- Turn json dictionaries (instaniate cards) into card objects.
            guard let representativeDictionaries = jsonDictionary["representatives"] as? [[String:Any]] else {
                completion([]); return }
            
            let repressentatives = representativeDictionaries.flatMap({Representative(JSONdictionary: $0) })
            
            // Pass the representative array of reps along 
            
            NSLog("\(repressentatives)")
            completion(repressentatives)
        }
        
        
        
    }
    
    
    
}




