//
//  AnimationStackView.swift
//  Chapter6-Animations
//
//  Created by ambar.septian on 17/05/23.
//

import SwiftUI

struct AnimationStackView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        // Run multiple animation by calling animation modifiers multiple times and the order animations are matters
        // You can passing nil to disable animation in animation modifier
        // .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct AnimationStackView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStackView()
    }
}
