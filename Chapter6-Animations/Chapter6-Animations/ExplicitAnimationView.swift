//
//  ExplicitAnimationView.swift
//  Chapter6-Animations
//
//  Created by ambar.septian on 17/05/23.
//

import SwiftUI

struct ExplicitAnimationView: View {
    @State private var animationAmount = 0.0
    
    
    var body: some View {
        Button("Tap me") {
            // by calling this closure animation, we are executing explicit animation and no need to call animation modifier in the respective view
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationView()
    }
}
