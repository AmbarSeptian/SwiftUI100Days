//
//  HabitListView.swift
//  MileStone-HabitTracking
//
//  Created by ambar.septian on 01/06/23.
//

import SwiftUI

struct HabitListView: View {
    @StateObject var viewModel = HabitViewModel()
    
//    @State var habits = [
//        Habit(id: .init(), name: "Practice Speaking", description: "Practice speaking in English by explaining what you learned by today"),
//        Habit(id: .init(), name: "Learn SwiftUI 100 Days", description: "Learn SwiftUI 100 Days from HackingWithSwift")
//    ]
    
    var currentHour: Int {
        let calendar = Calendar.current
        let date = Date()
        return calendar.dateComponents([.hour], from: date).hour ?? 0
    }
    
    var progress: Double {
        return Double(currentHour) / 24
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.habits) { habit in
                    NavigationLink {
                        DetailView(viewModel: viewModel, habit: habit)
                    } label: {
                        HStack(alignment: .center, spacing: 16) {
                            
                            if habit.isHabitDoneForToday {
                                CheckmarkView()
                                    .frame(width: 40, height: 40)
                                    
                            } else {
                                VStack {
                                    Text("\(24 - currentHour) hours left:")
                                        .font(.system(size: 10))
                                   CircleProgressView(progress: progress, lineWidth: 4)
                                        .frame(width: 40, height: 40)
                                }
                            }


                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(habit.name)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(habit.description)
                                    .lineLimit(1)
                                    .font(.subheadline)
                            }
                        }
                        
                        .padding([.trailing, .vertical])

                    }
                }
                .onDelete { offset in
                    deleteHabit(by: offset)
                }
                .onAppear {
                    print(viewModel.habits.count)
                }
            }
            .navigationTitle("My Habits")
            .toolbar {
                NavigationLink {
                    AddHabitView(viewModel: viewModel)
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add")
                    }
                }
            }
        }
        
    }
    
    private func deleteHabit(by offset: IndexSet) {
        viewModel.habits.remove(atOffsets: offset)
    }
}


// No need this custom shape actually :(, you can use `trim`
struct GaugeProgressShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
      
        
        // Need to reduce 90 angle to ensure the circle start on top
        let startAngle: Double = (0) - 90
        let endAngle: Double = (360) - 90
        
        path.addArc(center: .init(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2, startAngle: .degrees(startAngle), endAngle: .degrees(endAngle), clockwise: false)
        return path
    }
    
}


struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
    }
}
