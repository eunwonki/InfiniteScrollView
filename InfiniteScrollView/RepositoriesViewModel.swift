//
//  RepositoriesViewModel.swift
//  InfiniteScrollView
//
//  Created by wonki on 2023/05/21.
//

import Foundation
import Combine

class RepositoriesViewModel: ObservableObject {
    @Published private(set) var state = State()
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage else { return }
        
        GithubAPI.searchRepos(query: "swift", page: state.page)
            .sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            state.canLoadNextPage = false
        }
    }
        
    private func onReceive(_ batch: [Repository]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = batch.count == GithubAPI.pageSize
    }
    
    
    struct State {
        var repos: [Repository] = []
        var page: Int = 1
        var canLoadNextPage = true
    }
}
