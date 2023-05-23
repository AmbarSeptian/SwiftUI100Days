//
//  Question.swift
//  MileStone-Edutainment
//
//  Created by ambar.septian on 19/05/23.
//

import Foundation
import SwiftUI

struct Question {
    let firstNumber: Int
    let secondNumber: Int
    let operation: Operation
    let results: [Int: Bool]
    
    init(firstNumber: Int, secondNumber: Int, operation: Operation) {
        var secondNumber = max(1, secondNumber)
        
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.operation = operation
        
        let result: Int
        switch operation {
        case .addition:
            result = firstNumber + secondNumber
        case .subtraction:
            result = firstNumber - secondNumber
        case .multiplication:
            result = firstNumber * secondNumber
        case .division:
            result = firstNumber / secondNumber
        }
      
        
        var answers = [Int: Bool]()
        answers[result] = true
        
        while answers.count != 4 {
            let answer = Int.random(in: 0...99)
            if answers[answer] == nil {
                answers[answer] = false
            }
        }
        
        results = answers
    }
    
    
    static func generate(count: Int) -> [Question] {
        let randomNumber: () -> Int = {
            Int.random(in: 0...9)
        }
    
        return (0..<count).map { _ in
            let firstNumber = randomNumber()
            let secondNumber = randomNumber()
            let operation = Operation.allCases.randomElement()!
            
            return Question(firstNumber: firstNumber,
                         secondNumber: secondNumber,
                         operation: operation)
        }
    }
}

enum Operation: CaseIterable {
    case addition
    case subtraction
    case multiplication
    case division
    
    var operatorMath: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "x"
        case .division:
            return ":"
        }
    }
    
}

enum AnswerResult {
    case correct
    case wrong
    case empty
    
    var message: String {
        switch self {
        case .correct:
            return "Correct!"
        case .wrong:
            return "Oops, it's wrong"
        case .empty:
            return ""
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .correct:
            return Color.green
        case .wrong:
            return Color.red
        case .empty:
            return Color.white
        }
    }
}
