//
//  NewsDetails.swift
//  NewsListSwiftUI
//
//  Created by Aya Essam on 09/03/2021.
//

import SwiftUI
import Kingfisher

struct NewsDetails: View {
    @State var article: Article
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                
                KFImage(URL(string: article.urlToImage)!)
                    .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .top)

//                RemoteImage(url: article.urlToImage)
//                    .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .top)
                    
                Text(article.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding()
                
                Text(article.content)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding()
                
            }.offset(y: -140)
            .ignoresSafeArea()
        }
    }
}

//struct NewsDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetails(article: Articl)
//    }
//}
