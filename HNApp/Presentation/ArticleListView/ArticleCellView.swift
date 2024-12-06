//
//  ArticleCellView.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI
import Extensions

struct ArticleCellView: View {
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(article.title)
                .font(.interBold(size: 14))
                .padding(.vertical, 4)
            HStack(spacing: 4) {
                Text(article.author)
                    .font(.interRegular(size: 10))
                    .foregroundStyle(Color(UIColor.darkGray))
                Text("-")
                    .font(.interRegular(size: 10))
                    .foregroundStyle(Color(UIColor.darkGray))
                Text(article.timeElapsed)
                    .font(.interRegular(size: 10))
                    .foregroundStyle(Color(UIColor.darkGray))
            }
        }
    }
}

#Preview {
    ArticleCellView(
        article: Article(
            id: 42314797,
            title: "Christopher Hitchens and the Necessity of Universalism",
            url: "https://ourworldindata.org/data-insights/nearly-half-of-teenagers-globally-cannot-read-with-comprehension",
            author: "Cotterzz",
            createdAt: "2024-12-04T20:29:21Z"
        )
    )
}
