//
//  ContentView.swift
//  InfiniteScrollView
//
//  Created by wonki on 2023/05/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        RepositoriesList(
            repos: viewModel.state.repos,
            isLoading: viewModel.state.canLoadNextPage,
            onScrolledAtBottom: viewModel.fetchNextPageIfPossible
        )
        .onAppear(perform: viewModel.fetchNextPageIfPossible)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: RepositoriesViewModel())
    }
}
