//
//  TransformView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 29/05/23.
//

import SwiftUI

struct TransformView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var isUsingEvenOddRule = false

    var body: some View {
        
        VStack {
            
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: isUsingEvenOddRule))
            
            Group {
                Text("Offset")
                Slider(value: $petalOffset, in: -40...40)
                    .padding(.bottom)
                
                Text("Width")
                Slider(value: $petalWidth, in: 0...100)
                    .padding(.bottom)
                
                Toggle("Using Even-Odd Rule",isOn: $isUsingEvenOddRule)
            }
            .padding(.horizontal)
            
        
        }
    }
}

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            
            let rotation = CGAffineTransform(rotationAngle: number)
            
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: .init(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            let rotatingPetal = originalPetal.applying(position)
            
            path.addPath(rotatingPetal)
        }
        
        return path
    }
}

struct TransformView_Previews: PreviewProvider {
    static var previews: some View {
        TransformView()
    }
}
