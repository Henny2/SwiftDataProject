//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Henrieke Baunack on 12/17/23.
//

import SwiftData
import SwiftUI

struct EditUserView: View {
    
    @Bindable var user: User
    var body: some View {
        Form {
            TextField("user name", text: $user.name)
            TextField("user city", text: $user.city)
            DatePicker("join date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Taylor Swift", city: "Nashville", joinDate: Date())
        return EditUserView(user: user)
    } catch {
        return Text("There was an error: \(error.localizedDescription)")
    }
}
