//
//  iTunesResponse.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 04/06/23.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    
}
