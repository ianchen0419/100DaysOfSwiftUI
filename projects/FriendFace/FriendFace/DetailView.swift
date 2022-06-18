//
//  DetailView.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/5.
//

import SwiftUI

struct DetailView: View {
    @FetchRequest var users: FetchedResults<CachedUser>
    let userID: UUID
    let rows = [GridItem(.flexible())]
    
    init(userID: UUID) {
        _users = FetchRequest<CachedUser>(sortDescriptors: [], predicate: NSPredicate(format: "id = %@", userID as CVarArg))
        self.userID = userID
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Age")
                    Spacer()
                    Text(users[0].age.formatted())
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Company")
                    Spacer()
                    Text(users[0].wrappedCompany)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Registered")
                    Spacer()
                    Text(users[0].registeredText)
                        .foregroundColor(.secondary)
                }
            }
            
            Section("Email") {
                Text(users[0].wrappedEmail)
            }
            
            Section("Address") {
                Text(users[0].wrappedAddress)
                    .padding(.vertical, 4)
            }
            
            Section("About") {
                Text(users[0].wrappedAbout)
                    .padding(.vertical, 4)
            }
            
            Section("Tags") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(users[0].tagsArray, id: \.self) { tag in
                            NavigationLink {
                                TagView(tag: tag)
                            } label: {
                                Text(tag.wrappedName)
                                .font(.subheadline)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            }
                        }
                    }
                }
                .listRowBackground(Color.clear)
//                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            
            
            
            Section("Friends") {
                ForEach(users[0].friendsArray) { friend in
                    NavigationLink {
                        DetailView(userID: friend.wrappedID)
                    } label: {
                        Text(friend.wrappedName)
                    }
                }
            }
        }
        .navigationTitle(users[0].wrappedName)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static let user = User(
//        id: UUID(),
//        isActive: true,
//        name: "Alex Ron",
//        age: 12,
//        company: "ABC Ltd.",
//        friends: [Friend(id: UUID(), name: "Eric Matthew")])
//
//    static var previews: some View {
//        NavigationView {
//            DetailView(user: user)
//        }
//    }
//}
