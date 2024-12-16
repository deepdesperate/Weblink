//
//  ReadingDataViewModel.swift
//  Weblink
//
//  Created by Naman Deep on 06/12/24.
//

import Foundation
import Observation

@Observable
class ReadingDataViewModel {
    
    var readingList: [ReadingItem] = []
    
    init() {
    }
    
    func addNewReadingItem(title: String, urlString: String) {
        guard let url = URL(string: urlString) else { return }
        // TODO: show error to user if string is not valid url
        addNewReadingItem(title: title, url: url)
        
    }
    
    func addNewReadingItem(title: String, url: URL) {
        let new = ReadingItem(title: title, url: url)
        readingList.append(new)
        
        save()
    }
    
    func fileURL() -> URL {
        let directory = URL.documentsDirectory
        return directory.appendingPathComponent("readingList.json")
    }
    
    func save() {
        // take swift types and convert to Data -> Codable
        do {
            let data = try JSONEncoder().encode(readingList)
            let url = fileURL()
            try data.write(to: url)
            print("file location \(url.absoluteString)")
            
        } catch{
            print("error \(error)")
        }
        
        // Create url for file
        // write data to file
    }
    
    func load() {
        let url = fileURL()
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([ReadingItem].self, from: data)
            self.readingList = decoded
        }catch {
            print("error loading data: \(error)")
            useSampleData()
        }
    }
    
    func useSampleData(){
        self.readingList = ReadingItem.examples
    }
}


