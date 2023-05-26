//
//  ContentView.swift
//  Chapter7-iExpense
//
//  Created by ambar.septian on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
  
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: currentCurrency))
                        
                    }
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "wkwkk", type: "Personal", amount: Double.random(in: 0..<999))
//                    print(expense.amount)
//                    expenses.items.append(expense)
                    
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        print(offsets)
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Expenses: ObservableObject {
    
    init() {
        guard let savedItems = UserDefaults.standard.data(forKey: "Items"), let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) else {
            items = []
            return
        }
        
        items = decodedItems
    }
    
    @Published var items = [ExpenseItem]() {
        didSet {
            guard let encoded = try? JSONEncoder().encode(items) else { return  }
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

var currentCurrency: String {
    Locale.current.currency?.identifier ?? "USD"
}
