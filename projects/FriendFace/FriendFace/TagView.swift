//
//  TagView.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/8.
//

import SwiftUI

struct TagView: View {
    let tag: CachedTag
    var body: some View {
        List {
            Section("Related Users") {
                ForEach(tag.usersArray) { user in
                    NavigationLink {
                        DetailView(userID: user.wrappedID)
                    } label: {
                        Text(user.wrappedName)
                    }
                }
            }
        }
        .navigationTitle("Tag: \(tag.wrappedName)")
    }
}

//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagView()
//    }
//}
