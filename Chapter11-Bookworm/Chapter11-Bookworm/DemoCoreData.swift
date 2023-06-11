//
//  DemoCoreData.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 07/06/23.
//

import SwiftUI
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Error: \(error.localizedDescription)")
            }
        }
    }
}

struct DemoCoreData: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DemoCoreData_Previews: PreviewProvider {
    static var previews: some View {
        DemoCoreData()
    }
}
