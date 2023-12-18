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
    @State private var showingUpComingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate
                      )]
    
//    @Query(
//        filter: #Predicate<User> { user in
//            user.name.localizedStandardContains("r") &&
//            user.city == "Liverpool" },
//        sort: \User.name) var users: [User]
    
    
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            UsersView(minimumJoinDate: showingUpComingOnly ? .now : .distantPast, sortOrder: sortOrder)
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
                    Button(showingUpComingOnly ? "Show Everyone" : "Show upcoming"){
                        showingUpComingOnly.toggle()
                    }
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Sort", selection: $sortOrder){
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate
                                                  )])
                            Text("Sort by Join Date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name
                                                  )])
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
