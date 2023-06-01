//
//  ArrowView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 31/05/23.
//

import SwiftUI

struct ArrowView: View {
    var body: some View {
        Arrow()
            .stroke(.orange, lineWidth: 10)
    }
}

struct Arrow: Shape {
    var insetPercentage = 20.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let triangleHeight = rect.height / 3
        let triangle = createTriangle(rect: .init(x: rect.minX, y: rect.minY, width: rect.width, height: triangleHeight))
        
        let inset = insetPercentage * rect.width / 100
        path.addPath(triangle)
        
        var rectanglePath = Path()
        rectanglePath.addRect(.init(x: inset, y: triangleHeight, width: rect.width - (inset * 2), height: rect.height - triangleHeight))
        
   
        path.addPath(rectanglePath)
        
        path.move(to: .init(x: inset, y: triangleHeight))
        rectanglePath.addLine(to: .init(x: rect.width - (inset * 2), y: triangleHeight))
        
        
        return path
    }
    
    func createTriangle(rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.midX, y: rect.minY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
