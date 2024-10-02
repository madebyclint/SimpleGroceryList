//
//  SimpleGroceryListApp.swift
//  SimpleGroceryList
//
//  Created by Clint Bush on 10/1/24.
//

import SwiftUI
import SwiftData

@main
struct SimpleGroceryListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            let container = try ModelContainer(for: Item.self)
            
            // Make sure the persistent store is empty. If it's not, return the non-empty container.
            var itemFetchDescriptor = FetchDescriptor<Item>()
            itemFetchDescriptor.fetchLimit = 1
            
            guard try container.mainContext.fetch(itemFetchDescriptor).count == 0 else { return container }
            
            // This code will only run if the persistent store is empty.
            let sampleItems: [Item] = [
                Item(title: "almond milk"),
                Item(title: "eggs"),
                Item(title: "jasmine rice")
            ]
            
            for item in sampleItems {
                container.mainContext.insert(item)
            }
            
            return container
            // return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
