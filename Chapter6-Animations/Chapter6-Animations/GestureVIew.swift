//
//  GestureVIew.swift
//  Chapter6-Animations
//
//  Created by ambar.septian on 17/05/23.
//

import SwiftUI

struct GestureVIew: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 1))
            .offset(dragAmount)
            .animation(.spring(), value: dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in dragAmount = .zero}
            
            )
    }
}

struct GestureVIew_Previews: PreviewProvider {
    static var previews: some View {
        GestureVIew()
    }
}
