//
//  Order.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 05/06/23.
//

import Foundation
import SwiftUI

class Order: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var item = Item()
    
    @Published var address: Address = .init(name: "", streetAddress: "", city: "", zip: "")
    
    
    enum CodingKeys: CodingKey {
        case item, address
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(item, forKey: .item)
        try container.encode(address, forKey: .address)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        item = try container.decode(Item.self, forKey: .item)
        address = try container.decode(Address.self, forKey: .address)
    }
    
    init() {}
}

struct Item: Codable {
    var type = 0
    var quantity = 3
    
     var specialRequestEnabled = false {
        didSet {
            guard !specialRequestEnabled else { return }
            
            extraFrosting = false
            addSprinkles = false
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    
    var cost: Double {
        // 2 Dollar gan for Cupcake
        var cost = Double(quantity * 2)
        
        // Add complicated cost to make me rich
        cost += (Double(type) / 2)
        
        // extra 1 dollar for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 0.50 dollar for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        // Tax service gan
        cost += cost * 10/100
        
        return cost
        
    }
}

struct Address: Codable {
    var name: String
    var streetAddress: String
    var city: String
    var zip: String
    
    var hasValidAddress: Bool {
    
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
        
    }
}

extension String {
    var trimWhiteSpace: String {
        self.trimmingCharacters(in: .whitespaces)
    }
}
