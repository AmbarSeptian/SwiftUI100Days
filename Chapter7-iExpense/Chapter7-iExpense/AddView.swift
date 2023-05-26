//
//  AddView.swift
//  Chapter7-iExpense
//
//  Created by ambar.septian on 24/05/23.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        HStack {
                            Color.red
                                .frame(width: 20, height: 20) // Doesn't working :(, only able to detect Text only
                            Text(type)
                        }
                        
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currentCurrency))
                    .keyboardType(.decimalPad)
                
            }
            .toolbar {
                Button("Save") {
                    print(amount)
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            .navigationTitle("Add New Expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
