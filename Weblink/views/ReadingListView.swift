//
//  ReadingListView.swift
//  Weblink
//
//  Created by Naman Deep on 06/12/24.
//

import SwiftUI

struct ReadingListView: View {
    @Bindable var readingViewModel: ReadingDataViewModel
    @Binding  var selection: ReadingItem?
    @State private var newReadingEditorIsShown = false
    
    var body: some View {
        List($readingViewModel.readingList, editActions: [.move, .delete] ,selection: $selection){ $item in
            ReadingItemRow(item: item)
                .tag(item)
                .swipeActions(edge: .leading) {
                    Button(item.hasFinishedReading ? "Unread" : "Read"){
                        item.hasFinishedReading.toggle()
                    }
                }
        }
        .toolbar{
            Button{
                newReadingEditorIsShown.toggle()
            }label: {
                Label("Add New Web Link",systemImage: "plus")
            }
            EditButton()
        }
        .sheet(isPresented: $newReadingEditorIsShown) {
            ReadingDataEditorView(readingViewModel: readingViewModel)
        }
    }
}

fileprivate struct ReadingItemRow: View {
    let item: ReadingItem
    
    var body: some View {
        HStack{
            Image(systemName: item.hasFinishedReading ? "record.circle" : "circle")
                .foregroundStyle(.green)
                .font(.title2)
            
            VStack(alignment: .leading){
                Text(item.title)
                Text(item.creationDate.formatted(.dateTime))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    @State @Previewable var selection: ReadingItem?
    NavigationStack{
        ReadingListView(readingViewModel: ReadingDataViewModel(), selection: $selection)
    }
}
