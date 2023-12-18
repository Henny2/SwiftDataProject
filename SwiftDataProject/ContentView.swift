//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Henrieke Baunack on 12/17/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                    NavigationLink(value: user) {
                        Text(user.name)
                    }
                }
            .navigationDestination(for: User.self) { user in
                   EditUserView(user: user)
               }
            .navigationTitle("Users")
            .toolbar {
                Button("Add User", systemImage: "plus"){
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
