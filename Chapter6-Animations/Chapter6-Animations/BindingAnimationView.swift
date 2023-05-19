//
//  BindingAnimationView.swift
//  Chapter6-Animations
//
//  Created by ambar.septian on 17/05/23.
//

import SwiftUI

struct BindingAnimationView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale amount",
                    value: $animationAmount.animation(
                        .easeInOut(duration: 2)
                        .repeatCount(3, autoreverses: true)
                    ), // by using Binding the animation will run automatically without using animation modifier
                    in: 1...12)
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct BindingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimationView()
    }
}
