//
//  CardView.swift
//  NewsListSwiftUI
//
//  Created by Aya Essam on 10/03/2021.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    
    var article: Article
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 50, height: 365, alignment: .center)
                .cornerRadius(16.0)
                .shadow(radius: 9)
                .foregroundColor(.white)
            
            KFImage(URL(string: article.urlToImage)!)
                .frame(width: UIScreen.main.bounds.width - 50, height: 200, alignment: .top)
                .cornerRadius(16, corners: [.topLeft, .topRight])
            
//            RemoteImage(url: article.urlToImage)
//                .frame(width: UIScreen.main.bounds.width - 50, height: 200, alignment: .top)
//                .cornerRadius(16, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(article.author)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                
                Text(article.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .lineLimit(2)
                
                Text(article.articleDescription)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .lineLimit(3)
                
            }.offset(y: 200)
            .padding(.horizontal, 40.0)
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        let article: Article = Article(from: <#Decoder#>, title: "", articleDescription: "", author: "")
//        CardView(article: article)
//    }
//}
