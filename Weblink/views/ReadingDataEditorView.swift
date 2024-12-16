//
//  ReadingDataEditorView.swift
//  Weblink
//
//  Created by Naman Deep on 06/12/24.
//

import SwiftUI

struct ReadingDataEditorView: View {
    @Bindable var readingViewModel: ReadingDataViewModel
    @State private var title: String = ""
    @State private var newURLString: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("New Web Link")
            TextField("Title", text: $title)
            TextField("URL", text: $newURLString)
                .textInputAutocapitalization(.never)
            
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button("Save"){
                    readingViewModel.addNewReadingItem(title: title, urlString: newURLString)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    ReadingDataEditorView(readingViewModel: ReadingDataViewModel())
}
