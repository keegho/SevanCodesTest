//
//  File.swift
//  
//
//  Created by Kegham Karsian on 20/06/2021.
//

import Foundation

struct MatchesData: Decodable {
    let matches: [Match]
}


struct Match: Decodable {
    
    let homeImgUrl, awayImgUrl, homeTeam, awayTeam, location: String
    
}
