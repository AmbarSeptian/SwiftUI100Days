//
//  ColorCyclingVIew.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 29/05/23.
//

import SwiftUI

struct ContentColorView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingView(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Text("Amount : \(colorCycle.formatted())")
            Slider(value: $colorCycle)
            
        }
    }
}

struct ColorCyclingView: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient:
                                        Gradient(colors: [
                                                color(for: value, brightness: 1),
                                                color(for: value, brightness: 0.5),
                                            ]
                                        ),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
//                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
        // Flatten view into a single bitmap and SwiftUI can cached the result to improve the performance rendering
        // This API similar to rasterazation in CALayer, however it rely on View instead of Layer
        // Also this API utilizing Metal Framework under the hood
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentColorView()
    }
}
