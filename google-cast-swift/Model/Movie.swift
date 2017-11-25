//
//  Movie.swift
//  google-cast-swift
//
//  Created by jeremy on 25/11/17.
//  Copyright © 2017 jeremy. All rights reserved.
//

import Foundation

class Movie {
    let title: String!
    let imageUrl: String!
    let videoUrl: String!
    
    init(title: String, imageUrl: String, videoUrl: String) {
        self.title = title
        self.imageUrl = imageUrl
        self.videoUrl = videoUrl
    }
}
