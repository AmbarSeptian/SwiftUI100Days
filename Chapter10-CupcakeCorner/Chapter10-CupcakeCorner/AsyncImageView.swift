//
//  AsyncImageView.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 04/06/23.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
            
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image.resizable().scaledToFit()
                
            } placeholder: {
                Color.orange
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("Oops something wrong gan")
                } else {
                    ProgressView()
                }
            }
            
        
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
