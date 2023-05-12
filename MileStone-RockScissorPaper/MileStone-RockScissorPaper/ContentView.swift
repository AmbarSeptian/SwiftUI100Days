//
//  ContentView.swift
//  MileStone-RockScissorPaper
//
//  Created by ambar.septian on 12/05/23.
//

import SwiftUI

enum HandSign: String, CaseIterable {
    case rock
    case scissor
    case paper
    
    var imageName: String {
        switch self {
        case .rock:
            return "rectangle.roundedtop.fill"
        case .scissor:
            return "scissors"
        case .paper:
            return "newspaper"
        }
    }
}

enum ResultGame: Int {
    case win = 1
    case lose = -1
    case draw = 0
}

extension HandSign {
    static func > (lhs: HandSign, rhs: HandSign) -> ResultGame {
        switch (lhs, rhs) {
        case (.rock, .paper):
            return .lose
        case (.rock, .scissor):
            return .win
        case (.scissor, .paper):
            return .win
        case (.scissor, .rock):
            return .lose
        case (.paper, .rock):
            return .win
        case (.paper, .scissor):
            return .lose
        case (.paper, .paper), (.scissor, .scissor), (.rock, .rock):
            return .draw
        }
    }
}

struct ContentView: View {
    let signs = HandSign.allCases
    @State var currentSign: HandSign
    @State var roundCounter = 0
    @State var score = 0
    @State var currentResult: ResultGame? = nil
    @State var message = ""
  
    
    init() {
        currentSign = signs.randomElement()!
    }
    
    var body: some View {
        let showAlert = Binding<Bool>(
            get: { currentResult != nil },
            set: { _ in currentResult = nil }
        )
        
        ZStack {
            RadialGradient(stops: [.init(color: .customDarkOrange, location: 0.3), .init(color: .customLightOrange, location: 0.3)], center: .top, startRadius: 200, endRadius: 800)
            VStack(alignment: .center, spacing: 8) {
                Text("Round: \(roundCounter)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Score: \(score)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                Text("Computer Pick: ")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                SignView(currentSign: currentSign, isLarge: true, color: Color.customPink)
                    .padding(.bottom, 20)
                Text("Your Pick: ")
                
                HStack {
                    ForEach(signs, id: \.self) { sign in
                        Button {
                            checkWinner(sign: sign)
                        } label: {
                            SignView(currentSign: sign,
                                     isLarge: false,
                                     color: Color.customGreen)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                Spacer()

            }
            .padding()
            .alert("The result of this round :\n \(message)", isPresented: showAlert) {
                Button("OK") {
                    self.prepareNextGame()
                }
            }
        }
        
    }
    
    func checkWinner(sign: HandSign) {
        let resultGame = sign > currentSign
        
        switch resultGame {
        case .draw:
            message = "Draw!"
        case .lose:
            message = "Lose!"
        case .win:
            message = "Win!"
        }
        
        score += resultGame.rawValue
        roundCounter += 1
        currentResult = resultGame
    }
    
    func prepareNextGame() {
        if roundCounter == 10 {
            roundCounter = 0
            score = 0
        }
        
        var newSign: HandSign = signs.randomElement()!
        // Make sure the next element always different with the current sign
        while newSign == currentSign{
            newSign = signs.randomElement()!
        }
        currentSign = newSign
        message = ""
    }
}

struct SignView: View {
    let currentSign: HandSign
    let isLarge: Bool
    let color: Color
    
    var body: some View {
        ZStack {
            color
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack {
                Image(systemName: currentSign.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                Text(currentSign.rawValue.uppercased())
                    .foregroundColor(.white)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .frame(maxWidth: isLarge ? 120 : 80, maxHeight: isLarge ? 120 : 80)
    }
}

extension Color {
    static let customGreen = Color(red: 149/255, green: 191/255, blue: 164/255, opacity: 1)
    static let customPink = Color(red: 242/255, green: 136/255, blue: 155/255, opacity: 1)
    static let customLightOrange = Color(red: 255/255, green: 248/255, blue: 238/255, opacity: 1)
    static let customDarkOrange = Color(red: 242/255, green: 158/255, blue: 56/255, opacity: 1)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
