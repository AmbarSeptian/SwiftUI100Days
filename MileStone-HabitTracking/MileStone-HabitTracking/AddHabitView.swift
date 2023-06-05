//
//  AddHabitView.swift
//  MileStone-HabitTracking
//
//  Created by ambar.septian on 01/06/23.
//

import SwiftUI

struct AddHabitView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @ObservedObject var viewModel: HabitViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Name: ", text: $name)
            TextField("Description: ", text: $description, axis: .vertical)
            
        }.toolbar {
            Button {
                save()
            } label: {
                Text("Save")
            }
        }
        .navigationTitle("Add Habit")
    }
    
    func save() {
        let habit = Habit(id: .init(), name: name, description: description)
        viewModel.habits.append(habit)
        dismiss()
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddHabitView(viewModel: .init())
        }
    }
}
