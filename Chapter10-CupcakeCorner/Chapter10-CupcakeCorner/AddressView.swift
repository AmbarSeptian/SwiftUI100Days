//
//  AddressView.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 05/06/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
            Form {
                Section {
                    TextField("Name", text: $order.address.name)
                    TextField("Street Address", text: $order.address.streetAddress)
                    TextField("City", text: $order.address.city)
                    TextField("Zip", text: $order.address.zip)
                }
                
                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                    }
                }
                .disabled(!order.address.hasValidAddress)
            }
            .navigationTitle("Delivery Details")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: .init())
        }
        
    }
}
