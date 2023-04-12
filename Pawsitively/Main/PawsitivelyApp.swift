//
//  PawsitivelyApp.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/5/23.
//

import SwiftUI

@main
struct PawsitivelyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
