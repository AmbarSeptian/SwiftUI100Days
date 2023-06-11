//
//  AddBookView.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 07/06/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var alertErrorMessage = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        let showingAlertMessage = Binding {
            alertErrorMessage != ""
        } set: { value in
            if value == false {
                alertErrorMessage = ""
            }
        }

        
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's name", text: $author)
                }
                
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        saveBook()
                        
                    }
                }
            }
        }
        .alert("Error nih gan", isPresented: showingAlertMessage) {
            Text("Ok deh")
        } message: {
            Text(alertErrorMessage)
        }
        .navigationTitle("Add Book")
    }
    
    func saveBook() {
        if title.isEmpty {
            alertErrorMessage = "Please fill the title gan"
            return
        } else if author.isEmpty {
            alertErrorMessage = "Please fill the author gan"
            return
        }
        
        let newBook = Book(context: moc)
        newBook.id = UUID()
        newBook.title = title
        newBook.author = author
        newBook.rating = Int16(rating)
        newBook.genre = genre
        newBook.review = review
        newBook.date = Date()
        
        try? moc.save()
        dismiss()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
