//
//  RepositoryRow.swift
//  InfiniteScrollView
//
//  Created by wonki on 2023/05/21.
//

import SwiftUI

struct RowView<T>: View {
    let data: T
    
    var body: some View {
        
    }
}

struct RepositoryRow: View {
    let repo: Repository
    
    var body: some View {
        VStack {
            Text(repo.name).font(.title)
            Text("⭐️ \(repo.stargazers_count)")
            repo.description.map(Text.init)?.font(.body)
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repo: Repository(
            id: 1, name: "Any Repository",
            description: "bla bla", stargazers_count: 345))
    }
}
