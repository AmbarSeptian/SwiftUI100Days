//
//  GeometryView.swift
//  Chapter8-Moonshoot
//
//  Created by ambar.septian on 26/05/23.
//

import SwiftUI

struct GeometryView: View {
    var body: some View {
        VStack {
            Text("wkwk")
                .font(.headline)
            Image("ti8")
                .resizable() // Resize the image to the container
                .scaledToFill() // is Equal to contentMode in UIKIt
                .frame(width: 300, height: 300)
                .clipped() // By default clipToBounds is false
            
            GeometryReader { geo in
                Image("ti7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width * 0.8) // Image size based on container, similar ConstrainedSize in Texture

                    .clipped()
                
            }
                
            
        }
        
    }
}

struct GeometryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryView()
    }
}
