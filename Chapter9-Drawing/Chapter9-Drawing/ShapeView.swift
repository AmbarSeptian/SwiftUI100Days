//
//  ShapeView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 28/05/23.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Triangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            Triangle()
                .stroke(.orange, style: .init(lineWidth: 5))
                .frame(width: 200, height: 200)
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 200, height: 200)
        }
        
    }
}

struct Triangle: Shape {
    // The protocol is using the Imperative way instead of Declarative way? 🤔
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.midX, y: rect.minY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.midX, y: rect.minY))
        
        return path
        
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        /*
         Need to modified the angle since:
         - In the eyes of SwiftUI 0 degrees is not straight upwards, but instead directly to the right.
         - Shapes measure their coordinates from the bottom-left corner rather than the top-left corner, which means SwiftUI goes the other way around from one angle to the other. This is, in my not very humble opinion, extremely alien.

         */
        
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        path.addArc(center: .init(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        return path
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}

