//
//  TextEditorView.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 07/06/23.
//

import SwiftUI

struct TextEditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            // Is it similar to textView in UIKit
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
