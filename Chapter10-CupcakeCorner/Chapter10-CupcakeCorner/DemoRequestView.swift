//
//  DemoRequestView.swift
//  Chapter10-CupcakeCorner
//
//  Created by ambar.septian on 04/06/23.
//

import SwiftUI

struct DemoRequestView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear {
            Task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) else {
                print("Decoding failed gan")
                return
            }
            
            results = decodedResponse.results
        } catch {
            print("Error gan")
        }
    }
}

struct DemoRequestView_Previews: PreviewProvider {
    static var previews: some View {
        DemoRequestView()
    }
}
