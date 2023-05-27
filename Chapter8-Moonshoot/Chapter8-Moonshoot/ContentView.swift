//
//  ContentView.swift
//  Chapter8-Moonshoot
//
//  Created by ambar.septian on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let gridColumns = [
        GridItem(.adaptive(minimum: 150)),
    ]
    
    let listColumns = [
        GridItem(.flexible())
    ]
    
    @State var isGrid = true
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: isGrid ? gridColumns : listColumns) {
                    ForEach(missions) { mission in
                    
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                            
                        } label: {
                            
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                    
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.lightBackground)
                            }
                            
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.lightBackground)
                            )
                        }
                        
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshoot")
            .toolbar {
                Button {
                    isGrid.toggle()
                } label: {
                    if isGrid {
                        Image(systemName: "square.grid.2x2")
                    } else {
                        Image(systemName: "list.dash")
                    }
                    
                }
            }
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
