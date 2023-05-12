//
//  MyGridView.swift
//  Chapter3-ViewAndModifiers
//
//  Created by ambar.septian on 11/05/23.
//

import Foundation
import SwiftUI

struct MyGridView: View {
    var body: some View {
        GridStack(rows: 4, column: 4) { row, column in
            Image(systemName: "\(row * 4 + column).circle")
            Text("Row \(row), Column \(column)")
            
        }
            
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let column: Int
    // The caller of content doesn't need to specify wrapper (V / H Stack) if there are multiple items in `content`
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<column, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct MyGridView_Provider: PreviewProvider {
    static var previews: some View {
        MyGridView()
    }
}
