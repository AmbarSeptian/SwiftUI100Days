//
//  BlendView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 30/05/23.
//

import SwiftUI

struct BlendView: View {
    @State private var amount = 1.0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Fixed Blend Mode")
                ZStack {
                    Image("ti7")
                    //                .colorMultiply(.red) // Alternative API, you can apply blend without wrap it into ZStack and add Rectangle
                    
                    Rectangle()
                        .fill(.blue)
                        .blendMode(.multiply)
                }
                .frame(width: 400, height: 100)
                .clipped()
                .padding(.bottom, 80)
                
                Text("Multiple Colors Blending with Screen type")
                ZStack {
                    Circle()
                    //                    .fill(.red) -> this Color.red is not default red (#FF000) instead a custom red that can blend in light and dark mode
                        .fill(Color(red: 1, green: 0, blue: 0))
                        .frame(width: 200 * amount)
                        .offset(x: -50, y: 50)
                        .blendMode(.screen)
                    
                    Circle()
                    //                    .fill(.green)
                        .fill(Color(red: 0, green: 1, blue: 0))
                        .frame(width: 200 * amount)
                        .offset(x: 50, y: -80)
                        .blendMode(.screen)
                    
                    
                    Circle()
                    //                    .fill(.blue)
                        .fill(Color(red: 0, green: 0, blue: 1))
                        .frame(width: 200 * amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)
                .background(.black)
                
                Text("Saturation Image")
                Image("ti7")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .saturation(amount)
                
                Text("Blur Image")
                Image("ti7")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .blur(radius: (1 - amount) * 20)
                
                
                Slider(value: $amount)
                    .padding([.horizontal, .bottom], 40)
            }
            
        }
        
        
    }
}

struct BlendView_Previews: PreviewProvider {
    static var previews: some View {
        BlendView()
    }
}
