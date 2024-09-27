//
//  Post.swift
//  Navigation
//
//  Created by Lex 412 on 11.04.2022.
//

import UIKit

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int

    static var demoPosts: [Post] {
        return [Post(author: "autor1",
                     description: "test1",
                     image: "image1",
                     likes: 14,
                     views: 123),

                Post(author: "autor2",
                     description: "test2",
                    image: "image2",
                    likes: 2,
                    views: 10),

                Post(author: "autor3",
                    description: "test3",
                    image: "image3",
                    likes: 12,
                    views: 12),

                Post(author: "autor4",
                     description: "test4",
                     image: "image4",
                     likes: 12,
                     views: 15)
        ]
    }
}
