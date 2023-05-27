//
//  DemoNavigationView.swift
//  Chapter8-Moonshoot
//
//  Created by ambar.septian on 26/05/23.
//

import SwiftUI

struct DemoNavigationView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail Page nih gan \(row)")
                        .font(.headline)
                } label: {
                    Text("Hello world")
                        .padding()
                }
                /* Need to put the title inside the content of NavigationView rather than in NavigationView itself.
                 
                 Similar concept in UIKit when set navigation title, we use `self.title = ...` instead of `self.navigationController?.title = ...`
                 */
                .navigationTitle("SwiftUI")
            }
        }
    }
}

struct DemoNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DemoNavigationView()
    }
}
