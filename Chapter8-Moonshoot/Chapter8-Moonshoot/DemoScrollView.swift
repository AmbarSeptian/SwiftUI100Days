//
//  DemoScrollView.swift
//  Chapter8-Moonshoot
//
//  Created by ambar.septian on 26/05/23.
//

import SwiftUI

struct DemoScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) { // Lazy only render component on screen / render by on demand
                // The different Lazy and Regular Stack that Lazy will take up space available since needs trigger to load more content, meanwhile Regular stack will take the space as is needed
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .frame(height: CGFloat.random(in: 50...300))
                        .background(Color.orange)
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity) // Set the frame on VStack to tell the ScrollView to grow as maximum as possible (until edge of screen)
        }
    }
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new text gan \(text)")
        self.text = text
    }
}

struct DemoScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DemoScrollView()
    }
}
