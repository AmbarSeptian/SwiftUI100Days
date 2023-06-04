//
//  DetailView.swift
//  MileStone-HabitTracking
//
//  Created by ambar.septian on 02/06/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: HabitViewModel
    @State var habit: Habit
    
    @State private var percentage = 0.0
    @State private var isHabitDone: Bool
    
    init(viewModel: HabitViewModel, habit: Habit) {
        self.viewModel = viewModel
        
        // Very weird implementation, you can use regular initialize when you have @State
        // Because under the hood it will create backing pribate variable `_{your_variable}`
        // So you need to create initialize State with initial value
        self._habit = State<Habit>(initialValue: habit)
        self._isHabitDone = State<Bool>(initialValue: habit.isHabitDoneForToday)
        
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Text(habit.description)
                    .font(.body)
                Text("You have been stick to your habit for \(habit.counter) times")
                    .font(.footnote)
                if isHabitDone {
                    Text("Great!, keep your habit ")
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                }
                ZStack {
                    CheckmarkView()
                        .frame(width: 100, height: 100)
                        .rotation3DEffect(.degrees(isHabitDone ? 0 : 90), axis: (x: 0, y: 1, z: 0))
                    
                    if !isHabitDone {
                        DoneButton {
                            markHabitIsDone()
                        }
                    }
                    
                }
                .padding(.top, 80)
                Spacer()
            }
            .padding()
        }
        .navigationTitle(habit.name)
    }
    
    
    private func markHabitIsDone() {
        withAnimation(.linear(duration: 1)) {
            isHabitDone = true
            guard let index = viewModel.habits.firstIndex(where: { $0 == habit }) else {
                return
            }
            
            habit.lastCompletionDate = Date()
            habit.counter += 1
            viewModel.habits[index] = habit
        }
        
    }
}

struct DoneButton: View {
    @State private var progress = 0.0
    let action: (() -> ())
    
    init(action: @escaping () -> ()) {
        self.action = action
    }
    
    var body: some View {
        ZStack {

            CircleProgressView(progress: progress)
                .frame(width: 100, height: 100)
            Text("Done")
                .foregroundColor(.green)
                .fontWeight(.bold)
        }.onLongPressGesture(minimumDuration: 1, maximumDistance: 10, perform: {
            action()
            
        }, onPressingChanged: { flag in
            if flag {
                withAnimation(.easeIn(duration: 1)) {
                    progress = 1
                }
            } else {
                withAnimation {
                    progress = 0
                }
            }
        })
    }
}

struct CircleProgressView: View {
    var progress = 0.0
    var lineWidth = 10.0
    
    var body: some View {
        Circle()
            .rotation(.degrees(270))
            .trim(from: 0, to: progress)
            .stroke(LinearGradient(colors: [Color.green, Color.green.opacity(0.7)], startPoint: .bottom, endPoint: .top), lineWidth: lineWidth)
    }
}

struct CheckmarkView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(Color.green)
            Image(systemName: "checkmark")
                .resizable()
                .foregroundColor(.white)
                .scaleEffect(x: 0.5, y: 0.5)
                .padding(4)
        }
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: .init(), habit: .init(id: .init(), name: "My Habit", description: "Some Random Habit here"))
    }
}
