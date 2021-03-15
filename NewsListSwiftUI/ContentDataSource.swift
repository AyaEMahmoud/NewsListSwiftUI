//
//  ContentDataSource.swift
//  NewsListSwiftUI
//
//  Created by Aya Essam on 15/03/2021.
//

import Foundation
import SwiftUI
import Combine

class ContentDataSource: ObservableObject {
  @Published var items = [Article]()
  @Published var isLoadingPage = false
  private var currentPage = 1
  private var canLoadMorePages = true

  init() {
    loadMoreContent()
  }

  func loadMoreContentIfNeeded(currentItem item: Article?) {
    guard let item = item else {
      loadMoreContent()
      return
    }

    let thresholdIndex = items.index(items.endIndex, offsetBy: -5)
    if items.firstIndex(where: { $0.url == item.url }) == thresholdIndex {
      loadMoreContent()
    }
  }

  private func loadMoreContent() {
    guard !isLoadingPage && canLoadMorePages else {
      return
    }

    isLoadingPage = true

    let url = URL(string: "http://newsapi.org/v2/everything?q=egypt&from=2021-02-20&apiKey=e991749d19b64815a80e53b694a3df89&pageSize=10&page=\(currentPage)")!
    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: Response.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .handleEvents(receiveOutput: { response in
        self.canLoadMorePages = response.totalResults - self.items.count > 0
        self.isLoadingPage = false
        self.currentPage += 1
      })
      .map({ response in
        return self.items + response.articles
      })
      .catch({ _ in Just(self.items) })
        .assign(to: &$items)
  }
}
