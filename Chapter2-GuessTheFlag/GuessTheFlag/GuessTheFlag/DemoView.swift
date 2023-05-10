//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by ambar.septian on 08/05/23.
//

import SwiftUI

struct DemoView: View {
    @State var isShowingAlert = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
                
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)


            }
            
            Text("Your content")
//                .font(.title)
//                .foregroundColor(.secondary)
                .foregroundStyle(
                    LinearGradient(
                          colors: [.teal, .indigo],
                          startPoint: .top,
                          endPoint: .bottom
                      )
                )
                .padding(50)
                .background(.ultraThinMaterial)
            
            Button(action: pressButton) {
                Text("Press")
            }

        }
        
        .alert("Alert gan", isPresented: $isShowingAlert) {
            Button {
                
            } label: {
                Text("Ok gan")
            }

        }
        .ignoresSafeArea()
        
    }
    
    func pressButton() {
        print("wkwk")
        isShowingAlert = true
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
