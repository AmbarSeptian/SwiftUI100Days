//
//  BookListView.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 07/06/23.
//

import SwiftUI

struct BookListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author, order: .reverse),
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Count : \(books.count)")
                    .padding([.bottom, .horizontal])
                
                List {
                    ForEach(books) { book in
                        NavigationLink {
                            DetailView(book: book)
                        } label: {
                            HStack {
                                EmojiRatingView(rating: book.rating)
                                    .foregroundColor(book.ratingColor)
                                    .font(.largeTitle)
                                
                                VStack(alignment: .leading) {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                    Text(book.author ?? "Unknown Author")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                    .onDelete(perform: deleteBooks(at:))
                }

                                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }

        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // Find the book from array of fetch quest
            let book = books[offset]
            
            // delete it from the context
            moc.delete(book)
        }
        
        // Save the chagnes
        try? moc.save()
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
