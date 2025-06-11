//
//  ImageCarouselView.swift
//  IdealistaiOSChanllenge
//
//  Created by AnnaPersonalDev on 10/6/25.
//
import SwiftUI

struct ImageCarouselView: View {
    let imageUrls: [String]

    var body: some View {
        TabView {
            ForEach(imageUrls, id: \.self) { urlString in
                if let url = URL(string: urlString) {
                    AsyncImageView(url: url)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 200)
    }
}

struct AsyncImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else {
                ProgressView()
            }
        }
        .frame(height: 200)
        .clipped()
    }
}
