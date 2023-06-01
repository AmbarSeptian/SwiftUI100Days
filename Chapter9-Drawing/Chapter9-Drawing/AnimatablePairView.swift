//
//  AnimatablePairView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 30/05/23.
//

import SwiftUI

struct AnimatablePairView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation {
                    rows = 8
                    columns = 16
                }
            }
            
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    // If we have multiple value that we want to animate, we can use AnimatablePair
    // But this pair only consists of two kind of values
    // If we want to animatable three kind of values then:
    // AnimatablePair<Double, AnimatablePair<Double, Double>>
    // Very awkward 😑
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct AnimatablePairView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairView()
    }
}
