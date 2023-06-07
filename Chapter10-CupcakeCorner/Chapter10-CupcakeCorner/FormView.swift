//
//  FormView.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 04/06/23.
//

import SwiftUI

struct FormView: View {
    @State private var username = ""
    @State private var email = ""
    
    var isFormDisabled: Bool {
        return username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating acount...")
                }
                .disabled(isFormDisabled)
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
