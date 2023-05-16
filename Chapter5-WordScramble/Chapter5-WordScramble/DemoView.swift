//
//  DemoView.swift
//  Chapter5-WordScramble
//
//  Created by ambar.septian on 15/05/23.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        List {
            Section("Static Section") {
                Text("Static row!")
                Text("Static row!")
            }
            
            
            Section("Dynamic Section") {
                ForEach(0..<2) { item in
                    Text("Dynamic row \(item)!")
                }
            }
           
            
            Section("Static Section") {
                Text("Static row!")
                Text("Static row!")
            }
        }
        .listStyle(.grouped)
        
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
