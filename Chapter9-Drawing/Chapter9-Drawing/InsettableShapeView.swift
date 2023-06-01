//
//  InsettableShapeView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 28/05/23.
//

import SwiftUI

struct InsettableShapeView: View {
    var body: some View {
        VStack {
            Circle()
            // use .stroke to make stroke that drawing on half of border draw inside of the view and the other half will drawing on outside
    //            .stroke(.blue, lineWidth: 40)
           
            
            // use.strokeBorder to make stroke drawing on fully inside of the view
                .strokeBorder( .blue, lineWidth: 40)
            
            ArcInsettable(startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
                .strokeBorder( .orange, lineWidth: 40)
        }
    }
}

struct ArcInsettable: Shape, InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
      
        
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        path.addArc(center: .init(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += 10
        return arc
    }
    
}


struct InsettableShapeView_Previews: PreviewProvider {
    static var previews: some View {
        InsettableShapeView()
    }
}
