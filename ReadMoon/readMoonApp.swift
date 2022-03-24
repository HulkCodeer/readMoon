//
//  readMoonApp.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/24.
//

import SwiftUI

@main
struct readMoonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
