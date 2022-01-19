//
//  GroupItem.swift
//  List
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let comments:[Comment]
}

struct Comment: Identifiable {
    let id = UUID()
    let title: String
}

struct GroupItem: View {
    let posts = [Post(title: "Post #1", comments: [Comment(title: "Comment 1 for post 1"), Comment(title: "Comment 1 for post 2")]),
                 Post(title: "Post #2", comments: [Comment(title: "Comment 2 for post 1"), Comment(title: "Comment 2 for post 2")])]
    
    var body: some View {
        List {
            ForEach(posts) { post in
                Section(
                    content: {
                        ForEach(post.comments) { comment in
                            Text(comment.title)
                        }
                    },
                    header: {
                        Text(post.title)
                    })
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct GroupItem_Previews: PreviewProvider {
    static var previews: some View {
        GroupItem()
    }
}
