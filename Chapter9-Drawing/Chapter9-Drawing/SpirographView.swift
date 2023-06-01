//
//  SpirographView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 30/05/23.
//

import SwiftUI

struct SpirographView: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount = 1.0
    @State private var hue = 0.6
    
    var body: some View {
        VStack(spacing: 0) {
            Spirograph(innerRadius: Int(innerRadius),
                       outerRadius: Int(outerRadius),
                       amount: amount,
                       distance: Int(distance))
            .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
            
            Spacer()
            
            Group {
                Text("Inner Radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Outer Radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])
                
                Text("Color")
                Slider(value: $hue)
                    .padding([.horizontal, .bottom])
            }
        }
    }
}

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let amount: Double
    let distance: Int
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, b: outerRadius)
        let innerRadius = Double(self.innerRadius)
        let outerRadius = Double(self.outerRadius)
        let distance = Double(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
        var path = Path()
        
        for theta in stride(from: 0, to: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) + distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: .init(x: x, y: y))
            } else {
                path.addLine(to: .init(x: x, y: y))
            }
        }
        
    
        return path
    }
    
    func gcd(_ a: Int, b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
}

struct SpirographView_Previews: PreviewProvider {
    static var previews: some View {
        SpirographView()
    }
}
