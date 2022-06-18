//
//  ContentView.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/5.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.isActive, order: .reverse),
        SortDescriptor(\.name)
    ]) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List {
                if users.count == 0 {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    ForEach(users) { user in
                        NavigationLink {
                            DetailView(userID: user.wrappedID)
                        } label: {
                            HStack {
                                Circle()
                                    .fill(user.isActive ? Color.green : Color.clear)
                                    .frame(width: 10, height: 10)
                                Text(user.wrappedName)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Friend Face")
            .task {
                await loadData()
            }
        }
    }
    
    func saveData(_ data: [User]) {
        for userItem in data {
            let user = CachedUser(context: moc)
            user.id = userItem.id
            user.isActive = userItem.isActive
            user.name = userItem.name
            user.age = Int16(userItem.age)
            user.company = userItem.company
            user.email = userItem.email
            user.address = userItem.address
            user.about = userItem.about
            user.registered = userItem.registered
//            user.tags = userItem.tags.joined(separator: ",")
            
            for tagItem in userItem.tags {
                let tag = CachedTag(context: moc)
                tag.name = tagItem
                user.addToTags(tag)
            }
            
            for friendItem in userItem.friends {
                let friend = CachedFriend(context: moc)
                friend.id = friendItem.id
                friend.name = friendItem.name
                user.addToFriends(friend)
            }
            
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
    
    func loadData() async {
        if users.isEmpty {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let decodedResponse = try? decoder.decode([User].self, from: data) {
                    await MainActor.run {
                        saveData(decodedResponse)
                    }
                }
            } catch {
                print("Invalid Data")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
