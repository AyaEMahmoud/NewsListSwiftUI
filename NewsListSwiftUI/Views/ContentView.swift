//
//  ContentView.swift
//  NewsListSwiftUI
//
//  Created by Aya Essam on 08/03/2021.
//

import SwiftUI
import SwiftUIRefresh
import SwiftUIPullToRefresh

struct ContentView: View {
    @StateObject var dataSource = ContentDataSource()

    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVStack {
                    ForEach(dataSource.items, id: \.url) { article in
                        NavigationLink(destination: NewsDetails(article: article)) {
                            CardView(article: article)
                        }
                        .onAppear {
                            dataSource.loadMoreContentIfNeeded(currentItem: article)
                          }
                    }
                    if dataSource.isLoadingPage {
                              ProgressView()
                            }
                }
            }.navigationTitle("Today")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



