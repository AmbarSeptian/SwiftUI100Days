//
//  Model.swift
//  MileStone-HabitTracking
//
//  Created by ambar.septian on 01/06/23.
//

import Foundation

struct Habit: Equatable, Codable, Hashable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    var lastCompletionDate: Date?
    var counter = 0
    
    var isHabitDoneForToday: Bool {
        guard let lastCompletionDate = lastCompletionDate else {
            return false
        }
        
        return Calendar.current.isDateInToday(lastCompletionDate)
    }
}

class HabitViewModel: ObservableObject {
    // This @Published is needed to notify all views when the value is changed!!!
    @Published var habits = [Habit]() {
        didSet {
            guard let encoded = try? JSONEncoder().encode(habits) else {
                return
            }
            
            UserDefaults.standard.set(encoded, forKey: "savedHabit")
        }
    }
    
    init() {
        guard let data = UserDefaults.standard.data(forKey: "savedHabit"), let decodedHabits = try? JSONDecoder().decode([Habit].self, from: data) else {
            habits = []
            return
            
        }
        
        self.habits = decodedHabits
    }
    
}
