//
//  ContentView.swift
//  Chapter7-iExpense
//
//  Created by ambar.septian on 23/05/23.
//

import SwiftUI

struct DemoView: View {
    @StateObject var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your Name \(user.firstName), \(user.lastName)")
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
        }
        .padding(.all, 40)
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "wkwkwk")
        }
    }
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss
    // dismiss keyPath is part of the View (not custom)
    
    var body: some View {
        VStack {
            Text("Second View \(name)")
            Button("dismiss") {
                dismiss()
            }
        }
        
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}
