//
//  FeedVIew.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import SwiftUI

struct FeedView1: View {
    @State var posts: [content]
    @State private var showNewPostView = false
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                LazyVStack {
                    if(!posts.isEmpty){
                        GopherRowView1(image: posts[0].image, caption: posts[0].caption)
                    }
                    ForEach(0...20,id: \.self) { _ in
                        GopherRowView1(image: UIImage(systemName: "bookmark")!, caption: "test")
                            .padding(2)
                    }
                }
            }
            Button {
                showNewPostView.toggle()
            } label: {
                Image("postthing")
                .resizable()
                .renderingMode(.template)
                .frame(width: 28, height: 28)
                .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewPostView) {
                NewPostView1(posts: posts)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView1(posts: [])
    }
}



