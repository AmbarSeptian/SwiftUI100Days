//
//  AnimatingShapeView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 30/05/23.
//

import SwiftUI

struct AnimatingShapeView: View {
    @State private var insetAmount = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
                
            }
    }
}

struct Trapezoid: Shape {
    
    // This property part of protocol Shape
    // It's tracking the changes of interpolation when animation begin
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    var insetAmount: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: insetAmount, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct AnimatingShapeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingShapeView()
    }
}
