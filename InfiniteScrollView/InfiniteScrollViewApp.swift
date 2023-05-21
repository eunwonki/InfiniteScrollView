//
//  InfiniteScrollViewApp.swift
//  InfiniteScrollView
//
//  Created by wonki on 2023/05/21.
//

import SwiftUI

@main
struct InfiniteScrollViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: RepositoriesViewModel())
        }
    }
}
