//
//  PropertiesContentView.swift
//  Chapter3-ViewAndModifiers
//
//  Created by ambar.septian on 11/05/23.
//

import Foundation
import SwiftUI

struct PropertiesContentView: View {
    let motto1 = Text("Motto1")
    let motto2 = Text("Motto2")
    
    /*
     Create stored property in SwiftUI is not recommended, because the UI needs to calculate everytime value is changed
     let motto2 = Text("Motto2")
     */
    
    var motto3: some View {
      
            Text("WKKW")

      
    }
    
    @State var text = ""
    
    var body: some View {
        VStack {
            // Use Custom Modifier by calling .modifier
            motto1
                .modifier(CustomModifiedGan())
            
            // Use extension from Custom Modifier
            motto2
                .customStyleGan()
            
            motto3
                .watermarked("Hacking with swift")
        }
    }
}

struct CustomModifiedGan: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func customStyleGan() -> some View {
        modifier(CustomModifiedGan())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(_ text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


struct PropertiesContentView_Provider: PreviewProvider {
    static var previews: some View {
        PropertiesContentView()
    }
}
