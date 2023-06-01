//
//  ContentView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 28/05/23.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Path { path in
                path.move(to: .init(x: 200, y: 100))
                path.addLine(to: .init(x: 100, y: 300))
                path.addLine(to: .init(x: 300, y: 300))
                path.addLine(to: .init(x: 200, y: 100))
                
                /*
                path.closeSubpath()
                 */
            }
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .fill(.blue)
            
        }
        .padding()
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
