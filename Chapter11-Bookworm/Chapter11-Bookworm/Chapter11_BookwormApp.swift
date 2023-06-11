//
//  Chapter11_BookwormApp.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 07/06/23.
//

import SwiftUI

@main
struct Chapter11_BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
