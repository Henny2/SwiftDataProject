//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Henrieke Baunack on 12/17/23.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
