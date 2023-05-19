//
//  ImplictAnimationView.swift
//  Chapter6-Animations
//
//  Created by ambar.septian on 16/05/23.
//

import SwiftUI

struct ImplictAnimationView: View {
    
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(Circle()
            .stroke(.red)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
        )
        .onAppear{
            animationAmount = 2
        }
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(
//            .easeOut(duration: 2)
//            .delay(1)
//            .repeatCount(3, autoreverses: true),
//            value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1),
//                   value: animationAmount)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        ImplictAnimationView()
    }
}
