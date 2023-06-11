//
//  DemoBindingView.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 07/06/23.
//

import SwiftUI


struct DemoBindingView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            Toggle("Remember me", isOn: $rememberMe)
            PushButton(title: "Push Mid", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }.padding()
        
    }
}

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            /*
             Binding is used for observe the value changes, if you want to read and observe, it's better to use State
             However you can get the value by access the projectedValue and wrappedValue property
             
             $isOn.wrappedValue
             
             */
            
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
        
    }
}

struct DemoBindingView_Previews: PreviewProvider {
    static var previews: some View {
        DemoBindingView()
    }
}
