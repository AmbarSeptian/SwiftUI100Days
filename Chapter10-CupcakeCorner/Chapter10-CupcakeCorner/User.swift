//
//  User.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 04/06/23.
//

import Foundation

final class User: ObservableObject, Codable {
   @Published var name = "ambuy"
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
