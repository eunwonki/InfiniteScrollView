//
//  GithubAPI.swift
//  InfiniteScrollView
//
//  Created by wonki on 2023/05/21.
//

// modern networkin in swift
// https://www.vadimbulavin.com/infinite-list-scroll-swiftui-combine/

import Foundation
import Combine

struct GithubSearchResult<T: Codable>: Codable {
    let items: [T]
}

struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazers_count: Int
}

enum GithubAPI {
    static let pageSize = 10
    
    static func searchRepos(query: String, page: Int) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query)&sort=stars&per_page=\(Self.pageSize)&page=\(page)")!
        return URLSession.shared
            .dataTaskPublisher(for: url) // 1.
            .tryMap { try JSONDecoder().decode(GithubSearchResult<Repository>.self, from: $0.data).items } // 2.
            .receive(on: DispatchQueue.main) // 3.
            .eraseToAnyPublisher()
    }
}
