//
//  DetailView.swift
//  Chapter11-Bookworm
//
//  Created by ambar.septian on 10/06/23.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5) // It works like margin on CSS
                
            }
            
            Text(book.date?.formatted(date: .long, time: .omitted) ?? "Unknown Date")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding([.bottom, .horizontal])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
                .padding()
            
            // By using `constant` the RatingView stars are not changed when tapped the view
            // It's useful to switch the usage between interactive or displayed only
            // Although the tap trigger is still happened which is need to be careful
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .alert("Delete book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
//            HStack {
//                Image(systemName: "trash") // Doesn't working on alert
//            }
            Text("Are you sure?")
//            Label("Delete this book", systemImage: "trash")
//                .labelStyle(.titleAndIcon) // Doesn't working on alert
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func deleteBook() {
        moc.delete(book)
        
        // try? moc.save()
        dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book gan"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "B aja sih"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
