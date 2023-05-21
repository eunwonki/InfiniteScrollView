//
//  RepositriesList.swift
//  InfiniteScrollView
//
//  Created by wonki on 2023/05/21.
//

import SwiftUI

struct InfiniteScrollableList<T, Content: View>: View {
    let repos: [Repository]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    let content: Content<T>
    
    var body: some View {
        List {
            reposList
            
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private var reposList: some View {
        ForEach(repos) { repo in
            content.onAppear {
                if self.repos.last == repo {
                    self.onScrolledAtBottom()
                }
            }
        }
    }
}

struct RepositroiesList_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesList(
            repos: [], isLoading: false,
            onScrolledAtBottom: {
            
        })
    }
}
