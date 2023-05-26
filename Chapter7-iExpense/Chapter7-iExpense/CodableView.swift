//
//  CodableView.swift
//  Chapter7-iExpense
//
//  Created by ambar.septian on 23/05/23.
//

import SwiftUI

struct CodableView: View {
    @State private var user = AnotherUser(firstName: "Sherlock", secondName: "Holmes")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct CodableView_Previews: PreviewProvider {
    static var previews: some View {
        CodableView()
    }
}

struct AnotherUser: Codable {
    let firstName: String
    let secondName: String
    
}
