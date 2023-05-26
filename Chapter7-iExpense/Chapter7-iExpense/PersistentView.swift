//
//  PersistentView.swift
//  Chapter7-iExpense
//
//  Created by ambar.septian on 23/05/23.
//

import SwiftUI

struct PersistentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct PersistentView_Previews: PreviewProvider {
    static var previews: some View {
        PersistentView()
    }
}
