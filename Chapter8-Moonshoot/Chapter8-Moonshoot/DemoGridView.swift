//
//  DemoGridView.swift
//  Chapter8-Moonshoot
//
//  Created by ambar.septian on 26/05/23.
//

import SwiftUI

struct DemoGridView: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.adaptive(minimum: 80, maximum: 120)) // dynamic size,
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<100) { grid in
                    Group {
                        if Bool.random() {
                            Text("Item wkwkwkk \(grid)")
                        } else {
                            Text("Item \(grid)")
                        }
                    }
                    .background(Color.teal)
                    
                    
                }
            }
        }
    }
}

struct DemoGridView_Previews: PreviewProvider {
    static var previews: some View {
        DemoGridView()
    }
}
