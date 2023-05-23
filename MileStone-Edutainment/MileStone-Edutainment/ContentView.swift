//
//  ContentView.swift
//  MileStone-Edutainment
//
//  Created by ambar.septian on 19/05/23.
//

import SwiftUI

/*
Image by <a href="https://www.freepik.com/free-vector/hand-drawn-spring-wallpaper_12151052.htm#query=hill&position=18&from_view=search&track=sph">Freepik</a>
 */

struct ContentView: View {
    @State var questionsCount: Int = 5
    @State var questions = [Question]()
    @State var currentQuestion: Question?
    @State var answerResult: AnswerResult = .empty
    @State var resizeTextScale: CGFloat = 1
    
    var choices: [Int] {
        return currentQuestion?.results.map { $0.key } ?? []
    }
    
    init(){
        for family in UIFont.familyNames {
             print(family)
             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
    }
    
    var body: some View {
            VStack {
                Spacer()
                if questions.isEmpty {
                    Text("How many questions do you want?")
                        .customFont(size: 30)
                        .multilineTextAlignment(.center)
                    
                    Stepper(value: $questionsCount, in: 5...20, step: 5) {
                        Text("Questions: \(questionsCount)")
                            
                    }
                    Button("Let's Go!", action: generateQuestions)
                    
                } else {
                    questionView
                        .transition(.opacity)
                    if answerResult != .empty {
                        Button("Next") {
                            setCurrentQuestion()
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .background(backgroundImage)
            .ignoresSafeArea()
    }
    
    var questionView: some View {
        VStack {
            if let question = currentQuestion {
                Text(answerResult.message)
                    .foregroundColor(answerResult.foregroundColor)
                    .multilineTextAlignment(.center)
                    .shadow(color: .white, radius: 1)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .scaleEffect(resizeTextScale, anchor: .bottom)
                    .animation(.easeIn, value: resizeTextScale)
                
                    HStack {
                        Text("\(question.firstNumber)")
                        Text("\(question.operation.operatorMath)")
                        Text("\(question.secondNumber)")
                        Text(" = ?")
                    }
                    .font(.title)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.orange.opacity(0.5))
                            .border(Color.orange.opacity(0.8))
                    )
               
                
                GridStack(rows: 2, columns: 2) { index in
                    Button {
                        checkAnswer(choice: choices[index])
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.orange)
                                .frame(width: 100, height: 100)
                            Text("\(choices[index])")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title)
                                .shadow(color: .white.opacity(0.4), radius: 4)
                        }
                    }
                    .animation(.spring(), value: 1)
                    .disabled(answerResult != .empty)
                }
            }
        }
        .contentTransition(.opacity)
    }
    
    let skyGradient: LinearGradient = {
        let topColor = Color(red: 53/255, green: 214/255, blue: 237/255)
        let middleColor = Color(red: 122/255, green: 229/255, blue: 245/255)
        let bottomColor = Color(red: 201/255, green: 246/255, blue: 255/255)
        
        return LinearGradient(stops: [.init(color: topColor, location: 0.1),
            .init(color: middleColor, location: 0.3),
            .init(color: bottomColor, location: 0.9)],
                       startPoint: .top,
                       endPoint: .bottom)
        
        
    }()
    
    var backgroundImage: some View {
        Image("bg")
            .resizable()
            .scaledToFill()
            .opacity(0.8)
    }
    
    
    func generateQuestions() {
        questions = Question.generate(count: questionsCount)
        currentQuestion = questions.removeFirst()
    }
    
    func checkAnswer(choice: Int) {
        guard let question = currentQuestion else {
            return
        }
        
        if question.results[choice] ?? false {
            answerResult = .correct
            resizeTextScale = 1.5
        } else {
            answerResult = .wrong
            resizeTextScale = 1.2
        }
    }
    
    func setCurrentQuestion() {
        currentQuestion = questions.removeFirst()
        answerResult = .empty
        resizeTextScale = 1
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int) -> Content
    
    var body: some View {
        ForEach(0..<rows, id: \.self) { row in
            HStack {
                ForEach(0..<columns, id: \.self) { column in
                   content(rows * row + column)
                }
            }
        }
    }
}

struct CustomFont: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Chalkboard SE", size: size))
    }
}

extension Text {
    func customFont(size: CGFloat) -> some View {
        modifier(CustomFont(size: size))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
