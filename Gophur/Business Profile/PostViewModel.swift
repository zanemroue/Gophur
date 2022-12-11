//
//  PostViewModel.swift
//  Gophur
//
//  Created by Zane Mroue on 07/12/2022.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        posts.append(Post(id: 1,imageName: "zane"))
        posts.append(Post(id: 2,imageName: "zane"))
        posts.append(Post(id: 3,imageName: "zane")) //change these "image8"s to images posted by user
        posts.append(Post(id: 4,imageName: "zane"))
        posts.append(Post(id: 5,imageName: "zane"))
        posts.append(Post(id: 6,imageName: "zane"))
        posts.append(Post(id: 7,imageName: "zane"))
    }
}
