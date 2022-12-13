//
//  PostCell.swift
//  Gophur
//
//  Created by Zane Mroue on 07/12/2022.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(self.post.imageName)
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
        }
    }
}

