//
//  CheckoutView.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 05/06/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingErrorMessage = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.item.cost, format: .currency(code: "USD"))")
                
                Button("Place Order", action:  {
                    Task {
                        await placeOrder()
                    }
                    
                })
                    .padding()
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Oops, Checkout failed gan, Please try it again in a few minutes", isPresented: $showingErrorMessage) {
                Button("Sipp") {}
            }
            .alert("Thank You!", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode Order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            confirmationMessage = "Your order for \(decodedOrder.item.quantity)x \(Order.types[decodedOrder.item.type].lowercased()) cupcakes is on its way! \(decodedOrder)"
            showingConfirmation = true
        } catch {
            showingErrorMessage = true
        }
        
       

    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: .init())
        }
        
    }
}
