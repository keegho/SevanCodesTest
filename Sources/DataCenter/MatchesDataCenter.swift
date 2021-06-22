//
//  File.swift
//  
//
//  Created by Kegham Karsian on 20/06/2021.
//

import Foundation
import JSONLoader

class MatchesDataCenter: NSObject {
    
    fileprivate weak var delegate: OperationDelegte?
    fileprivate(set) var matches: MatchesDataCenter?
    
    private override init(){}
    
    static let shared: MatchesDataCenter = {
        let sharedInstance = MatchesDataCenter()
        return sharedInstance
    }()
    
    func loadMatchesUsingDelegate(_ delegate: OperationDelegte?) {
        
        self.delegate = delegate
        
        do {
            matches = try loadFromBundle("data.json", as: Matches.self)
            delegate?.didFinishOperation(.Matches)
        } catch let err {
            delegate?.didRecieveErrorForOperation(.Matches, andWithError: err.localizedDescription)
        }
    }
}
