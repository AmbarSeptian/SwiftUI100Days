//
//  ContentView.swift
//  Chapter3-ViewAndModifiers
//
//  Created by ambar.septian on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
            Button("Hello World") {
                print(type(of: self.body))
                print("wkwk")
            }
            .background(.red)
            .frame(width: 200, height: 200)
            
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
            Spacer()
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            .blur(radius: 5)
            Spacer()
        }
        .padding()
    }
}

/*
 
 Button("Hello World") {
 }
 .background(.red)
 .frame(width: 200, height: 200)
 
 
 ModifiedContent<
    ModifiedContent<
        Button<Text>, _
            BackgroundStyleModifier<Color>
            >, _FrameLayout>
 
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
