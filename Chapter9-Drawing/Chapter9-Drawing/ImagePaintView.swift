//
//  ImagePaintView.swift
//  Chapter9-Drawing
//
//  Created by ambar.septian on 29/05/23.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 100)
                .background(.red)
            
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 100)
                .border(.red, width: 30)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 100)
                .background(
                    Image("ti7")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 100)
                        .clipped()
                        
                )
            
            /* Border can't use Image :(
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 100)
                .border(
                    Image("ti7"), width: 30
                )
             */
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 100)
                .border(
                    ImagePaint(image: Image("ti7"), scale: 0.2), width: 30
                )
            
            // Repeating image gan
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 100)
                .border(
                    ImagePaint(image: Image("ti7"), sourceRect: .init(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30
                )
            
            // ImagePaint works fine on the Shape
            Capsule()
                .strokeBorder(ImagePaint(image: Image("ti7"), scale: 0.1) , lineWidth: 20)
                .frame(width: 300, height: 100)
        }
        
        
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
