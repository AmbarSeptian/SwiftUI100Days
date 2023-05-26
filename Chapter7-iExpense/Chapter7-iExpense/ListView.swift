//
//  ListView.swift
//  Chapter7-iExpense
//
//  Created by ambar.septian on 23/05/23.
//

import Foundation
import SwiftUI

struct ListView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)

                    
                    Button("Add number") {
                        numbers.append(currentNumber)
                        currentNumber += 1
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
