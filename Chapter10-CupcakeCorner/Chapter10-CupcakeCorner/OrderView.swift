//
//  OrderView.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 05/06/23.
//

import SwiftUI

struct OrderView: View {
    @StateObject var order = Order() // todo change let
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.item.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes : \(order.item.quantity)", value: $order.item.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $order.item.specialRequestEnabled.animation())
                    
                    if order.item.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.item.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.item.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
